---
layout: post
title: "Policy Set: Gateway"
section: Blog
date: 2025-10-07T17:00:00
author: Eric Garver
---

## Introduction to Policy Sets

Firewalld has supported policies for many years. Policies are super
flexible and can describe all kinds of traffic patterns. That same
flexibility can make it daunting for new users to get started. The
solution is Policy Sets.

A Policy Set is a predefined collection of policies that solve a
particular use case, e.g. a home gateway. This gives users a starting
configuration that may be fine tuned for a specific environment. They
also serve as documentation by example.

Policy Sets are administratively disabled by default. For them to
activate you must remove the disable.

A whole set can be activated with one command:

```
# firewall-cmd --policy-set gateway --remove-disable
```

## Policy Set: Gateway

The Gateway Policy Set may be used for a gateway, including a home
router.

### Getting Started

Creating a home router with the Gateway Policy Set is only a handful of
commands. Two commands to add your LAN interface and uplink interface
(Internet). One command to activate the Policy Set. One final command to
reload the firewall.

```
# firewall-cmd --permanent --zone internal --add-interface eth0
# firewall-cmd --permanent --zone external --add-interface eth1
# firewall-cmd --permanent --policy-set gateway --remove-disable
# firewall-cmd --reload
```

That's it. Congratulations! You now have an easy to use line rate home
router!

### Adding a Forward Port

One common thing for a home router is to expose some services, e.g. ssh
for remote access. The Gateway Policy Set already has a policy to allow
this. One just has to add the forward port.

This example forwards port `2222` from the Internet to the internal host
`10.0.0.22:22`.

```
# firewall-cmd --permanent --policy gateway-world-to-HOST \
               --add-forward-port port=2222:proto=tcp:toport=22:toaddr=10.0.0.22
# firewall-cmd --reload
```

## Documentation

Every Policy Set has a dedicated man page that describes the set and its
intended use case. You can discover all sets in the primary man page for
Policy Sets. See `man firewalld.policy-sets`. For example, the gateway
set man page is `man firewalld.policy-set-gateway`.

## Availability

Policy sets are available in firewalld v2.3.0 and later.
