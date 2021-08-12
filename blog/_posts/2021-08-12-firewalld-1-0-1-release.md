---
layout: post
title: "firewalld 1.0.1 release"
section: Blog
date: 2021-08-12T15:00:00
author: Eric Garver
category: release
---

A new release of firewalld, version 1.0.1, is available.

This is a bug fix only release.

```
$ git shortlog --grep "^fix" v1.0.0..v1.0.1  
```
Eric Garver (1):
- fix(firewalld): keep linux capability CAP_SYS_MODULE

Marcos Mello (1):
- fix(service): UPnP Client: actually allow SSDP traffic

Neal Gompa (1):
- fix(config): Fix RPM macros to test if firewall-cmd is executable

-----

Source available here:

 * Tarball: [firewalld-1.0.1.tar.gz](https://github.com/firewalld/firewalld/releases/download/v1.0.1/firewalld-1.0.1.tar.gz)
 * SHA256: 35a89949e527cd7fc863574b2eceb80f99092cca838c79c4c1fce2228a01eb09
 * Complete changelog on github: [1.0.0 to 1.0.1](https://github.com/firewalld/firewalld/compare/v1.0.0...v1.0.1)
