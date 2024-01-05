---
layout: post
title: "firewalld 2.1.0 release"
section: Blog
date: 2024-01-05T12:00:00
author: Eric Garver
category: release
---

A new release of firewalld, version 2.1.0, is available.

This is a feature release. It also includes all bug fixes since v2.0.0.

```
git shortlog --no-merges --grep "^feat" v2.0.0..v2.1.0
```

Thomas Haller (3):
- feat(service): add DNS over QUIC (DoQ) Service
- feat(icmp): add ICMPv6 Multicast Listener Discovery (MLD) types
- feat(fw): add ReloadPolicy option in firewalld.conf

Vinícius Ferrão (1):
- feat(service): add submission service (tcp 587)

Vixea (1):
- feat(service): Add alvr

nser77 (1):
- feat(service): add vrrp

-----

Source available here:

 * Tarball: [firewalld-2.1.0.tar.gz](https://github.com/firewalld/firewalld/releases/download/v2.1.0/firewalld-2.1.0.tar.gz)
 * SHA256: 22e3c700c2e4867796e9c22cf929cba4b2c143c8884240cfb9f3ef731366ff71
 * Complete changelog on github: [2.0.0 to 2.1.0](https://github.com/firewalld/firewalld/compare/v2.0.0...v2.1.0)
