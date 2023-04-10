---
layout: post
title: "Zone Priorities"
section: Blog
date: 2023-04-10T14:00:00
author: Eric Garver
category: feature
---

## Introduction

Firewalld gained a new feature called [Zone Priorities](https://github.com/firewalld/firewalld/pull/1101). This
allows the user to control the order in which packets are classified
into zones.

## What It Looks Like

The zone priority can be set using command line option `--set-priority`.
Similar to policies and rich rules, a lower priority value has higher
precedence. e.g. -10 occurs before 100

```
# firewall-cmd --permanent --zone internal --set-priority -10

# firewall-cmd --permanent --zone internal --get-priority
-10

# firewall-cmd --permanent --info-zone internal
internal
  target: default
  ingress-priority: -10    <--- new field
  egress-priority: -10     <--- new field
  icmp-block-inversion: no
  interfaces: 
  sources: 
  services: dhcpv6-client mdns samba-client ssh
  ports: 
  protocols: 
  forward: yes
  masquerade: no
  forward-ports: 
  source-ports: 
  icmp-blocks: 
  rich rules: 
```

This will guarantee that packets are consider for the `internal` zone before
other zones.

We can see this is the generated nftables rules.

```
chain filter_INPUT_POLICIES {
        iifname "dummy0" jump filter_IN_policy_allow-host-ipv6
        iifname "dummy0" jump filter_IN_internal     <--------- before ipset source @block_country in "drop" zone
        iifname "dummy0" reject with icmpx admin-prohibited
        ip saddr @block_country jump filter_IN_policy_allow-host-ipv6
        ip saddr @block_country jump filter_IN_drop
        ip saddr @block_country drop
        jump filter_IN_policy_allow-host-ipv6
        jump filter_IN_public
        reject with icmpx admin-prohibited
}
```

## Control Ingress and Egress Independently

Using `--set-priority` will set the priority for both ingress and egress
classification. This is sufficient for most use cases. However, they may
be set independently with `--set-ingress-priority` and
`--set-egress-priority`.

```
# firewall-cmd --permanent --zone internal --set-ingress-priority -10
# firewall-cmd --permanent --zone internal --set-egress-priority 100

# firewall-cmd --permanent --info-zone internal
internal (active)
  target: default
  ingress-priority: -10
  egress-priority: 100
  icmp-block-inversion: no
  interfaces: dummy0
  sources: 
  services: dhcpv6-client mdns samba-client ssh
  ports: 
  protocols: 
  forward: yes
  masquerade: no
  forward-ports: 
  source-ports: 
  icmp-blocks: 
  rich rules: 
```

## Previous Behavior

Prior to this feature users had to rely on firewalld's undocumented behavior of
classification. It was impossible to classify interfaces before sources.

That order is roughly:

1. source based, i.e. `--add-source`
  - these are sorted by _zone name_
2. interface based, i.e. `--add-interface`

When zone priorities are equal then classification uses this legacy behavior.

## Summary

It's now possible to customize packet classification in firewalld using zone
option `--set-priority`.
