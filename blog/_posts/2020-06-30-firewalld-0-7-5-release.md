---
layout: post
title: "firewalld 0.7.5 release"
section: Blog
date: 2020-06-30T16:00:00
author: Eric Garver
category: release
---

A new release of firewalld, version 0.7.5, is available.

This is a bug fix only release.

Alexander Bokovoy (1):
- fix: update dynamic DCE RPC ports in freeipa-trust service

Eric Garver (30):
- fix(systemd): Conflict with nftables.service
- fix(direct): rule in a zone chain
- test(direct): rule in a zone chain
- fix(client): addService needs to reduce tuple size
- test(dbus): zone: fix false failure due to list order
- test(dbus): zone: fix zone runtime functional test title
- fix(doc): dbus: signatures for zone tuple based APIs
- fix(config): bool values in dict based import/export
- fix(dbus): service: don't cleanup config for old set APIs
- fix(ipset): flush the set if IndividiualCalls=yes
- fix(firewall-offline-cmd): remove instances of "[P]" in help text
- docs: replace occurrences of the term blacklist with denylist

Phil Sutter (1):
- fix: core: rich: Catch ValueError on non-numeric priority values

Vrinda Punj (3):
- docs(README): add libxslt for doc generation
- fix(cli): add --zone is an invalid option with --direct
- fix(cli): add ipset type hash:mac is incompatible with the family parameter

-----

Source available here:

 * Tarball: [firewalld-0.7.5.tar.gz](https://github.com/firewalld/firewalld/releases/download/v0.7.5/firewalld-0.7.5.tar.gz)
 * SHA256: 45a8a7dbc084ef56ce306154d3834922e7f1fc2bf11b6c821f579cad51313226
 * Complete changelog on github: [0.7.4 to 0.7.5](https://github.com/firewalld/firewalld/compare/v0.7.4...v0.7.5)
