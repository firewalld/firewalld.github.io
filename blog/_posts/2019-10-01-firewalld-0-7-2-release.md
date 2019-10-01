---
layout: post
title: "firewalld 0.7.2 release"
section: Blog
date: 2019-10-01T14:00:00
author: Eric Garver
category: release
---

A new release of firewalld, version 0.7.2, is available.

This is a bug fix only release.

- fix: direct: removeRules() was mistakenly removing all rules
- fix: guarantee zone source dispatch is sorted by zone name
- fix: nftables: fix zone dispatch using ipset sources in nat chains
- doc: add --default-config and --system-config
- fix: --add-masquerade should only affect ipv4
- fix: nftables: --forward-ports should only affect IPv4
- fix: direct: removeRules() not removing all rules in chain
- dbus: service: fix service includes individual APIs
- fix: allow custom helpers using standard helper modules
- fix: service: usage of helpers with '-' in name
- fix: Revert "ebtables: drop support for broute table"
- fix: ebtables: don't use tables that aren't available
- fix: fw: initialize _rfc3964_ipv4

-----

Source available here:

 * Tarball: [firewalld-0.7.2.tar.gz](https://github.com/firewalld/firewalld/releases/download/v0.7.2/firewalld-0.7.2.tar.gz)
 * SHA256: fbd1b72b3c4b4d0c20659f664b2ba36175364ffbb9cebf3bdfaf9b5e6983be77
 * Complete changelog on github: [0.7.1 to 0.7.2](https://github.com/firewalld/firewalld/compare/v0.7.1...v0.7.2)
