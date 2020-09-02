---
layout: post
title: "Policy Objects: Introduction"
section: Blog
date: 2020-09-02T12:00:00
author: Eric Garver
category: feature
---

# Policy Objects: Introduction
A new feature, policy objects, will be part of the next firewalld feature
release (v0.9.0). This is a major feature that has been in the works for
almost a full year. It also significant because it closes one of the long
standing gaps in firewalld's functionality: forward and output filtering.

## Motivation
With some exceptions (e.g. masquerade, forward-ports) firewalld was
previously limited to being an end-station firewall. This meant you could not
use it to filter traffic flowing between virtual machines, containers, and
zones. A subset of that functionality was available by using the `direct`
interface and writing your own `iptables` rules, but it wasn't a great user
experience.

What is needed is a way to apply a policy for traffic flowing between zones.
Then the user can attach firewalld's primitives: services, ports, rich rules,
etc. to the policy. The end result is something that provides a very similar
user interface to zones, but is much more powerful.

## What does it look like?
Manipulating policies is very similar to zones. This was a deliberate design
decision to make them approachable for existing firewalld users.

Here are some examples for adding features to a policy:

```
# firewall-cmd --policy mypolicy --add-service ssh
# firewall-cmd --policy mypolicy --add-port 1234/tcp
# firewall-cmd --policy mypolicy --add-masquerade
```

This example shows the settings of the built-in policy `allow-host-ipv6`.
```
# firewall-cmd --info-policy allow-host-ipv6
allow-host-ipv6 (active)
  priority: -15000
  target: CONTINUE
  ingress-zones: ANY
  egress-zones: HOST
  services:
  ports:
  protocols:
  masquerade: no
  forward-ports:
  source-ports:
  icmp-blocks:
  rich rules:
       rule family="ipv6" icmp-type name="neighbour-advertisement" accept
       rule family="ipv6" icmp-type name="neighbour-solicitation" accept
       rule family="ipv6" icmp-type name="router-advertisement" accept
       rule family="ipv6" icmp-type name="redirect" accept
```

## Relationship to Zones
Policies are applied to traffic flowing between zones in a unidirectional
manner. This allows different policies depending on the direction of traffic.

```
+----------+     policyA     +----------+
|          |  <------------  |          |
| libvirt  |                 |  public  |
|          |  ------------>  |          |
+----------+     policyB     +----------+
```

This diagram shows `policyA` that applies to traffic flowing from the `public`
zone to the `libvirt` zone. `policyB` applies to traffic flowing from the
`internal` zone to the `public` zone.

The configuration changes necessary to result in the diagram above are:

```
# firewall-cmd --permanent --new-policy policyA
# firewall-cmd --permanent --policy policyA --add-ingress-zone public
# firewall-cmd --permanent --policy policyA --add-egress-zone libvirt

# firewall-cmd --permanent --new-policy policyB
# firewall-cmd --permanent --policy policyB --add-ingress-zone libvirt
# firewall-cmd --permanent --policy policyB --add-egress-zone public
```

## Manipulating Policies
Policies must be created by the user.

```
# firewall-cmd --permanent --new-policy mypolicy
```

### Ingress and Egress Zones
As shown in the diagram above policies exists between zones. This means a set
of ingress and egress zones must be defined before the policy becomes active.
In this context an ingress zone is the zone from which the packet originated.
The egress zone is the zone to which the packet is destined.

This example makes `mypolicy` apply to traffic flowing from the `public` zone
to the `internal` zone:

```
# firewall-cmd --permanent --policy mypolicy --add-ingress-zone public
# firewall-cmd --permanent --policy mypolicy --add-egress-zone internal
```

The ingress and egress zone list can also be manipulated in the runtime
configuration. It is also valid to use multiple zones in the ingress and
egress zone lists.

```
# firewall-cmd --policy mypolicy --add-ingress-zone public
# firewall-cmd --policy mypolicy --add-ingress-zone external
```

Making a policy got inactive is done by emptying the ingress and/or the egress
zone list.

```
# firewall-cmd --policy mypolicy --remove-ingress-zone internal
```

### Priority
Multiple policies can be applied to the same set of traffic. Therefore it's
useful to have a priority to sort the policies by precedence.

```
# firewall-cmd --permanent --policy mypolicy --set-priority -500
```

The following rules apply to policy priorities:

1. policies with negative priorities apply before rules in zones
2. policies with positive priorities apply after rules in zones
    - This is especially important to understand because many zones have catch
      all accept/drop/reject. This applies to zone with a `--set-target` that
      is _not_ `default`.
3. priority 0 is reserved and not usable

### Default Target
Policies have a `--set-target` option just like zones. This is a catch-all at
the end of the policy's rules. The default is `CONTINUE` which means packets
will be subject to rules in following policies and zones. Other values are:
`ACCEPT`, `DROP`, and `REJECT`.

```
# firewall-cmd --permanent --policy mypolicy --set-target CONTINUE
```

## Symbolic Zones
There are a couple of symbolic zones for use in the ingress and egress zone
lists: `HOST`, and `ANY`. `HOST` is used to allow policies for traffic
originating from or destined to the host running firewalld. `ANY` is used to
apply a policy to all current and future zones. `ANY` is effectively a wildcard
for all zones.

This example, creates a policy that applies to traffic originating from the
host running firewalld and is destined to any zone. Or said differently
traffic in the `OUTPUT` chain.

```
# firewall-cmd --permanent --new-policy myOutputPolicy
# firewall-cmd --permanent --policy myOutputPolicy --add-ingress-zone HOST
# firewall-cmd --permanent --policy myOutputPolicy --add-egress-zone ANY
```

## Man Pages
There are new man pages for policies.

- Concepts: [firewalld.policies](/documentation/man-pages/firewalld.policies.html)
- XML configuration: [firewalld.policy](/documentation/man-pages/firewalld.policy.html)

## Default Policies
At present firewalld ships with a single built-in policy: `allow-host-ipv6`. This
policy is active by default and allows a subset of ICMPv6 necessary for
bootstrapping IPv6 connectivity.
