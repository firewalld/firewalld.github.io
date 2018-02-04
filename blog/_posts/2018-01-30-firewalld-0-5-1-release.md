---
layout: post
title: "firewalld 0.5.1 release"
section: Blog
date: 2018-01-30T16:00:00
author: Eric Garver
category: release
---

A new release of firewalld, version 0.5.1, is available.

This is a bug fix only release.

- ipXtables: fix iptables-restore wait option detection
- python3 compatibility fixes
- ebtables: fix missing default value to set\_rule()
- fw\_zone: fix invalid reference to \_\_icmp\_block\_inversion

-----

Source available here:

 * Tarball: [firewalld-0.5.1.tar.gz](https://github.com/firewalld/firewalld/archive/v0.5.1.tar.gz)
 * SHA256: 267878f1774df84173bb0103c1d50c208109d0d5a032c23811081ed39cacd0ec
 * Complete changelog on github: [0.5.0 to 0.5.1](https://github.com/firewalld/firewalld/compare/v0.5.0...v0.5.1)
