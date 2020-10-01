---
layout: post
title: "Policy Objects: Filtering Container and Virtual Machine Traffic"
section: Blog
date: 2020-09-30T16:00:00
author: Eric Garver
category: feature
---

## Introduction
A handful of container and virtual machine runtimes have some level of
integration with firewalld. The reality is the integration is minimal partly
due to limitations in older firewalld versions. With firewalld's new Policy
Objects feature we can improve the situation and allow users to filter their
container and virtual machine traffic.

Podman, for example, adds the container's block of address to the `trusted`
zone. This effectively means firewalld does no filtering on the container
traffic. All the traffic is immediately accepted. Podman will also install its
own iptables rules to do other things: forward ports, masquerading. With
policy objects this duality of iptables and firewalld is unnecessary as it can
all be done in firewalld.

This post is both an illustration of what container and virtual machine
runtimes can do to better integrate with firewalld and an example of what is
possible with policy objects.

## Podman as an Example
In this post we'll use Podman as our example. First it's useful to know how
Podman currently interacts with firewalld and iptables.

Podman adds each container to firewalld's `trusted` zone. This is what allows
the container traffic to pass through firewalld.

```
# firewall-cmd --zone trusted --list-all
trusted (active)
  target: ACCEPT
  icmp-block-inversion: no
  interfaces: 
  sources: 10.88.0.14/32
  services: 
  ports: 
  protocols: 
  masquerade: no
  forward-ports: 
  source-ports: 
  icmp-blocks: 
  rich rules: 
```

Podman also uses iptables to setup masquerading for the container. This is the
part that could not be done via firewalld before policy objects.

```
# iptables -t nat -L
[..]

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination         
CNI-a4307a257bab71a40e0f6b64  all  --  10.88.0.14           anywhere             /* name: "podman" id: "7b9e4aef72c4cf188df65589f43bf4256488959700557163f57e96920d18ec2a" */

[..]

Chain CNI-a4307a257bab71a40e0f6b64 (1 references)
target     prot opt source               destination         
ACCEPT     all  --  anywhere             10.88.0.0/16         /* name: "podman" id: "7b9e4aef72c4cf188df65589f43bf4256488959700557163f57e96920d18ec2a" */
MASQUERADE  all  --  anywhere            !224.0.0.0/4          /* name: "podman" id: "7b9e4aef72c4cf188df65589f43bf4256488959700557163f57e96920d18ec2a" */
```

### What's Missing?
What's missing from all the above is filtering. Podman has no method of
filtering incoming or outgoing traffic on behalf of the container. Later in
this post we'll see that's now possible in firewalld.

## Creating a Podman Zone
To make things easier to reason about we'll create a new zone called `podman`.
This will make it clear that the zone is intended for containers.

```
# firewall-cmd --permanent --new-zone podman
```

## Filtering to the World
Above we saw that Podman is creating iptables rules to perform masquerading.
Let's see how this could be done natively in firewalld instead.

First we need a new policy for our outbound container traffic.

```
# firewall-cmd --permanent --new-policy podmanToWorld
# firewall-cmd --permanent --policy podmanToWorld --add-ingress-zone podman
# firewall-cmd --permanent --policy podmanToWorld --add-egress-zone ANY
```

*Note*: ANY means any egress zone, but it does *not* include traffic destined
to the host running firewalld.

At this point you can add anything you want to the new policy and it will
filter traffic originating from the container and destined to any other host.

Let's use this new policy to enable masquerading for the containers.

```
# firewall-cmd --permanent --policy podmanToWorld --add-masquerade
```

But we can also filter anything we want. Let's say I don't want my containers
connecting to remote ftp servers.

```
# firewall-cmd --permanent --policy podmanToWorld --add-rich-rule='rule service name="ftp" reject'
```

As another example, maybe I don't want my containers communicating with the
`192.168.0.0/16` network. We can reject that traffic as well.

```
# firewall-cmd --permanent --policy podmanToWorld --add-rich-rule='rule family=ipv4 destination address=192.168.0.0/16 reject'
```

## Forwarding Ports to a Container
We can also use a policy to forward ports from the host to the container.

```
# firewall-cmd --permanent --new-policy fwdPortsPodman
# firewall-cmd --permanent --policy fwdPortsPodman --add-ingress-zone ANY
# firewall-cmd --permanent --policy fwdPortsPodman --add-egress-zone ANY
```

Now add the forward ports.

```
# firewall-cmd --permanent --policy fwdPortsPodman --add-forward-port=port=8080:proto=tcp:toport=80:toaddr=10.88.0.14
```

*Note*: In the past it was possible to forward ports to a container, but it
required adding the `forward-port` to the *ingress* zone, e.g. `public`. This
has the major disadvantage that you must know the expected ingress zone.
That's not necessary with policies.

## Filtering to the Host
You can also use a policy to filter traffic from the containers to the host.

```
# firewall-cmd --permanent --new-policy podmanToHost
# firewall-cmd --permanent --policy podmanToHost --add-ingress-zone podman
# firewall-cmd --permanent --policy podmanToHost --add-egress-zone HOST
```

A good setting would be to block all traffic to the host by default then
selectively open the specific things you need.

```
# firewall-cmd --permanent --policy podmanToHost --set-target REJECT
# firewall-cmd --permanent --policy podmanToHost --add-service dhcp
# firewall-cmd --permanent --policy podmanToHost --add-service dns
```

*Note*: Alternatively you can get the same effect by adding the services to
the `podman` zone and setting `--set-target=reject`. This is because most, but
not all (e.g. masquerade), features added to a zone filter on the INPUT chain.

## Move the Container to the Podman Zone
The last step is to reload firewalld and move the container to the new podman
zone. This will cause all the policies we created to become active.

```
# firewall-cmd --reload
# firewall-cmd --zone podman --change-source 10.88.0.14/32
```

Note that this is a *runtime* configuration change. That's because podman adds
the container's IP address to the runtime only.

## Removing Podman's iptables Rules
Now that firewalld is handling the masquerading we can flush the iptables
rules created by Podman. After this there will be no Podman related rules in
iptables. Everything is being handled by firewalld.

```
# iptables -t nat -F
```

*Disclaimer*: This command is a flush of all NAT rules. If there are other
rules not installed by Podman they'll also be deleted.

## Conclusion
Hopefully this post illustrated the flexibility of policy objects and how you
might use them with Podman. The same approach can be taken for docker and
libvirt as well. In the future it would be great to see these projects expand
their integration with firewalld and avoid the direct usage of iptables.
