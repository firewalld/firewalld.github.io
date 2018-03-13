---
layout: post
title: "firewalld 0.5.2 release"
section: Blog
date: 2018-03-13T14:00:00
author: Eric Garver
category: release
---

A new release of firewalld, version 0.5.2, is available.

This is a bug fix only release.

- fix rule deduplication causing accidental removal of rules
- log failure to parse direct rules xml as an error
- firewall-config: Break infinite loop when firewalld is not running
- fix set-log-denied not taking effect
- po: update translations

-----

Source available here:

 * Tarball: [firewalld-0.5.2.tar.gz](https://github.com/firewalld/firewalld/archive/v0.5.2.tar.gz)
 * SHA256: aa8e47bb11d9b25953ed2e278a989b0eb052b4466ea030ade0ed0cf1955614a4
 * Complete changelog on github: [0.5.1 to 0.5.2](https://github.com/firewalld/firewalld/compare/v0.5.1...v0.5.2)
