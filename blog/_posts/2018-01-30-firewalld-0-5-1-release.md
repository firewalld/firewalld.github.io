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
 * SHA256: 57d0639bed3a845899ea16f52fbd68b2e62fdca75cea50be60d651e4255be00e
 * Complete changelog on github: [0.5.0 to 0.5.1](https://github.com/firewalld/firewalld/compare/v0.5.0...v0.5.1)
