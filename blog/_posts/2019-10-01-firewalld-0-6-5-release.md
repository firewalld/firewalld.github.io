---
layout: post
title: "firewalld 0.6.5 release"
section: Blog
date: 2019-10-01T15:00:00
author: Eric Garver
category: release
---

A new release of firewalld, version 0.6.5, is available.

This is a bug fix only release.

- fix: do not allow zone drifting
- fix: test/regression/gh258: add missing keyword for rhbz 1713823
- fix: rich rule destination with services
- fix: test/regression/pr323: skip if GRE module doesn't exist
- fix: direct: removeRules() was mistakenly removing all rules
- Revert "fix: ipXtables: using "mangle" in zone not dependent on "nat""
- fix: guarantee zone source dispatch is sorted by zone name
- fix: nftables: fix zone dispatch using ipset sources in nat chains
- doc: add --default-config and --system-config
- fix: --add-masquerade should only affect ipv4
- fix: nftables: --forward-ports should only affect IPv4
- fix: direct: removeRules() not removing all rules in chain
- fix: allow custom helpers using standard helper modules
- fix: service: usage of helpers with '-' in name
- fix: Revert "ebtables: drop support for broute table"
- fix: ebtables: don't use tables that aren't available
- Change-interface can accept permanent option

-----

Source available here:

 * Tarball: [firewalld-0.6.5.tar.gz](https://github.com/firewalld/firewalld/releases/download/v0.6.5/firewalld-0.6.5.tar.gz)
 * SHA256: a2bbec0d8fed3bfc186f1ccc6b543dd94106f8cd431dd56a635272e431f54b91
 * Complete changelog on github: [0.6.4 to 0.6.5](https://github.com/firewalld/firewalld/compare/v0.6.4...v0.6.5)
