---
layout: post
title: "firewalld 0.5.3 release"
section: Blog
date: 2018-05-11T17:00:00
author: Eric Garver
category: release
---

A new release of firewalld, version 0.5.3, is available.

This is a bug fix only release.

- fix ICMP block not being present in FORWARD chain
- allow adding entries to ipsets with timeout as indicated by firewall-cmd man page
- add service gre with proto-gre helper to allow conntracked GRE

-----

Source available here:

 * Tarball: [firewalld-0.5.3.tar.gz](https://github.com/firewalld/firewalld/archive/v0.5.3.tar.gz)
 * SHA256: ba105de0b6dc75d208cc675718a140973e2eab2f60aa285068b0438331639ebc
 * Complete changelog on github: [0.5.2 to 0.5.3](https://github.com/firewalld/firewalld/compare/v0.5.2...v0.5.3)
