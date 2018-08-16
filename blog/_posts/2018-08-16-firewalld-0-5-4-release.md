---
layout: post
title: "firewalld 0.5.4 release"
section: Blog
date: 2018-08-16T15:00:00
author: Eric Garver
category: release
---

A new release of firewalld, version 0.5.4, is available.

This is a bug fix only release.

- update translations
- fw: if failure occurs during startup set state to FAILED
- fw\_direct: avoid log for untracked passthrough queries
- firewall-config: fix some untranslated strings
- Rich Rule Masquerade inverted source-destination in Forward Chain
- don't forward interface to zone requests to NM for generated interfaces
- firewall-cmd: add --check-config option
- firewall-offline-cmd: add --check-config option
- ipset: check type when parsing ipset definition
- firewall-config: Add ipv6-icmp to the protocol dropdown box
- core: logger: Remove world-readable bit from logfile
- IPv6 rpfilter: explicitly allow neighbor solicitation

-----

Source available here:

 * Tarball: [firewalld-0.5.4.tar.gz](https://github.com/firewalld/firewalld/archive/v0.5.4.tar.gz)
 * SHA256: 20854eab514d703dac782821c30b4e0c340648a2c2daba5fd695f8b9a1e6eac2
 * Complete changelog on github: [0.5.3 to 0.5.4](https://github.com/firewalld/firewalld/compare/v0.5.3...v0.5.4)
