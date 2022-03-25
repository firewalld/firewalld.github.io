---
layout: post
title: "Release Container Images"
section: Blog
date: 2022-03-25T15:00:00
author: Eric Garver
category: feature
---

## Introduction

Firewalld releases are now additionally distributed as an OCI container
image. This image is usable on any Linux distribution with docker (or
podman) and Linux kernel >= 5.3.

This image is self contained. The firewalld configuration lives inside
the container. It does not integrate with host services (e.g.
NetworkManager).

It provides a very convenient and risk-free way to trial firewalld.

## Starting the container

The container can be started in one command:

```
# docker run -d --network host --privileged \
             --name my-firewalld quay.io/firewalld/firewalld
```

This will pull (download) the image from
[quay.io](https://quay.io/repository/firewalld/firewalld) if the image
is not already in the local cache.

The `--network host` means the container will run in the default network
namespace and thus make firewall changes affecting the entire host.

## Making firewall changes

To make changes to firewalld running inside the container `docker exec`
must be used.

For example, to list all the settings in the default zone:

```
# docker exec my-firewalld firewall-cmd --list-all
public
  target: default
  icmp-block-inversion: no
  interfaces: 
  sources: 
  services: dhcpv6-client ssh
  ports: 
  protocols: 
  forward: yes
  masquerade: no
  forward-ports: 
  source-ports: 
  icmp-blocks: 
  rich rules: 
```

## Shell alias for convenience

The above is a long command. It can be made more convenient with a shell
alias.

```
# alias my-firewall-cmd='docker exec my-firewalld firewall-cmd'
```

Then use the alias:

```
# my-firewall-cmd --list-all
public
  target: default
  icmp-block-inversion: no
  interfaces: 
  sources: 
  services: dhcpv6-client ssh
  ports: 
  protocols: 
  forward: yes
  masquerade: no
  forward-ports: 
  source-ports: 
  icmp-blocks: 
  rich rules: 
```

## What it looks like on the host

As started above, the container runs in the default network namespace.
This means we should see the changes in the host's nftables output.

```
# my-firewall-cmd --add-service https
success

# nft list ruleset |grep 443
                tcp dport 443 ct state { new, untracked } accept
```

## Saving the container and firewalld's configuration

The modified container can be saved to an image like any other
container. This is useful if you want to save your precious firewalld
container and configuration.

```
# docker commit my-firewalld my-firewalld
sha256:2923f03657ee877b55a72f80f6211c7065328a47b247c05fd3a0f09dcea67fc3

# docker image list
REPOSITORY                    TAG       IMAGE ID       CREATED          SIZE
my-firewalld                  latest    2923f03657ee   2 seconds ago    247MB
quay.io/firewalld/firewalld   latest    b0d3f2666c4f   4 hours ago      246MB
```

## Optional: Store firewalld's configuration on the host

An alternative to storing the configuration inside the container is to
use a volume mount to store it on the host. This has the major advantage
that the container can be upgraded to a new release of the container
image while keeping your firewalld configuration intact.

To accomplish you must start the container with a volume mount.

```
# docker run -d -v /etc/firewalld:/etc/firewalld
             --network host --privileged \
             --name my-firewalld quay.io/firewalld/firewalld
```

Otherwise, usage is the same as described above.

## Summary

The container image provides a low effort way to get started with
firewalld while also being easy to manage.
