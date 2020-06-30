---
layout: post
title: "firewalld 0.8.3 release"
section: Blog
date: 2020-06-30T15:00:00
author: Eric Garver
category: release
---

A new release of firewalld, version 0.8.3, is available.

This is a bug fix only release.

Alexander Bokovoy (1):
- fix: update dynamic DCE RPC ports in freeipa-trust service

Eric Garver (33):
- fix: nftables: ipset: port ranges for non-default protocols
- fix(systemd): Conflict with nftables.service
- fix(direct): rule in a zone chain
- fix(client): addService needs to reduce tuple size
- fix(doc): dbus: signatures for zone tuple based APIs
- fix(config): bool values in dict based import/export
- fix(dbus): service: don't cleanup config for old set APIs
- fix(ipset): flush the set if IndividiualCalls=yes
- fix(firewall-offline-cmd): remove instances of "[P]" in help text
- fix(rich): source mac with nftables backend
- docs: replace occurrences of the term blacklist with denylist

Phil Sutter (1):
- fix: core: rich: Catch ValueError on non-numeric priority values

Vrinda Punj (3):
- docs(README): add libxslt for doc generation
- fix(cli): add --zone is an invalid option with --direct
- fix(cli): add ipset type hash:mac is incompatible with the family parameter

-----

Source available here:

 * Tarball: [firewalld-0.8.3.tar.gz](https://github.com/firewalld/firewalld/releases/download/v0.8.3/firewalld-0.8.3.tar.gz)
 * SHA256: 4ecb16d82c2825ccfb8f109e543c0492cf6ea8c43e2d0f59901bddcead037dc6
 * Complete changelog on github: [0.8.2 to 0.8.3](https://github.com/firewalld/firewalld/compare/v0.8.2...v0.8.3)
