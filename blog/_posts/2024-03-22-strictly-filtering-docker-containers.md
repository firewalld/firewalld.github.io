---
layout: post
title: "Strict Filtering of Docker Containers"
section: Blog
date: 2024-04-03T16:00:00
author: Eric Garver
---

## Introduction

Docker supports publishing ports for a container. This allows external
access to the container. When firewalld is running these published ports
are honored and a hole is opened in firewalld. For most users, e.g.
workstations, this a good thing as docker works transparently.

For some users, this is not expected. They want firewalld to be strict.
They want to only allow traffic explicitly configured via firewalld.
Fortunately this can be achieved with some configuration.

## Docker Configuration

To have full control of docker containers via firewalld one must first
disable iptables in docker.

This can be done by adding `iptables: false` to the daemon
configuration.

```
# cat /etc/docker/daemon.json
{
    "iptables": false
}
```

Then the host must be rebooted. Restarting Docker is not enough to clean
up all the pre-existing iptables rules.

```
# reboot
```

Now the containers won't have any iptables firewall rules automatically
created.

## Verify Docker Does Not Install iptables rules

This is optional and just for illustration purposes.

After the reboot starting a docker container will cause containers to
not have internet access. This means that docker is not setting up
iptables rules.

```
# docker run -it --rm debian:stable

# apt update
Ign:1 http://deb.debian.org/debian stable InRelease
Ign:2 http://deb.debian.org/debian stable-updates InRelease
Ign:3 http://deb.debian.org/debian-security stable-security InRelease
0% [Connecting to deb.debian.org]
```

In the next step this will be fixed by doing the networking natively in
firewalld. Restarting the container is not necessary.

## Firewalld Configuration

Now setup firewalld to natively perform all networking for docker with
the following configuration.

```
firewall-cmd --permanent --zone docker --add-source 172.17.0.1/16

firewall-cmd --permanent --new-policy dockerToWorld
firewall-cmd --permanent --policy dockerToWorld --add-ingress-zone docker
firewall-cmd --permanent --policy dockerToWorld --add-egress-zone ANY
firewall-cmd --permanent --policy dockerToWorld --set-target ACCEPT
firewall-cmd --permanent --policy dockerToWorld --add-masquerade

firewall-cmd --reload
```

This creates a policy, `dockerToWorld`, to give the container internet
access. Note that the `--add-source` above assumes the default address
range used by docker.

### Verify Firewalld Rules

After the firewalld rules are created verify the container has internet
access.

```
# apt update
Get:1 http://deb.debian.org/debian stable InRelease [151 kB]
Get:2 http://deb.debian.org/debian stable-updates InRelease [55.4 kB]
Get:3 http://deb.debian.org/debian-security stable-security InRelease [48.0 kB]
Get:4 http://deb.debian.org/debian stable/main amd64 Packages [8786 kB]
Get:5 http://deb.debian.org/debian stable-updates/main amd64 Packages [12.7 kB]
Get:6 http://deb.debian.org/debian-security stable-security/main amd64 Packages [150 kB]
Fetched 9203 kB in 1s (7189 kB/s)
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
8 packages can be upgraded. Run 'apt list --upgradable' to see them.
```

### Adding Firewalld Native Forward Ports

Since docker is no longer using iptables ports published with
`--publish` will no longer work. It's simply ignored. Ports must be
exposed with firewalld.

The first step is to create another policy, `dockerFwdPort`, to allow
external access to the container.

```
firewall-cmd --permanent --new-policy dockerFwdPort
firewall-cmd --permanent --policy dockerFwdPort --add-ingress-zone ANY
firewall-cmd --permanent --policy dockerFwdPort --add-egress-zone HOST
```

Note: Older firewalld versions (before v2.0.z) require using
`egress-zone=ANY`.

To add port forwarding (equivalent of docker --publish) to a specific
container use `--add-forward-port` in the `dockerFwdPort` policy.  This
example forwards port `8080` to to `80`. Note that the containers IP
address must be known.

```
firewall-cmd --permanent --policy dockerFwdPort --add-forward-port port=8080:proto=tcp:toport=80:toaddr=172.17.0.2
```

Lastly reload the firewall.

```
firewall-cmd --reload
```

## Results

This small amount of configuration allows firewalld to strictly filter
docker container network traffic by doing all the networking natively in
firewalld.

## A Note About Podman

A similar configuration can be done with Podman. Podman 4.x can use
environment variable `NETAVARK_FW=none` to disable the network plugin.
Podman 5.x will have a `containers.conf` for it.

The firewalld configuration is the same except that the `podman` zone is
used instead of the `docker` zone.

## Bugs Referencing This Topic

This topic has been discussed and referenced in numerous reports.

- [How to manage docker exposed port by firewall-cmd?](https://github.com/firewalld/firewalld/issues/869)
- [Conflict with CNI DNAT rule and top-level accept of DNAT'd packets](https://github.com/firewalld/firewalld/issues/556)
- [podman-quadlet loads NAT rules that bypass firewall restrictions](https://issues.redhat.com/browse/RHEL-26522)
