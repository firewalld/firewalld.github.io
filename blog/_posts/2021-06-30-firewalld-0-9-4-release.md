---
layout: post
title: "firewalld 0.9.4 release"
section: Blog
date: 2021-06-30T10:00:00
author: Eric Garver
category: release
---

A new release of firewalld, version 0.9.4, is available.

This is a bug fix only release.

```
$ git shortlog --grep "^fix" v0.9.3..v0.9.4
```
Eric Garver (10):
- fix(dbus): conf: setting deprecated properties should be ignored
- fix(dbus): properties: IPv4 and IPv6 should be true if using nftables
- fix(fw): when checking tables make sure to check the actual backend
- fix(ipset): nftables: use interval flag for "ip" types
- fix(rpm): applet: don't replace config modified by admin
- fix(rpm): logrotate: don't replace config modified by admin
- fix(ipv6_filter): match fwmark
- fix(direct): rule order with multiple address with -s/-d
- fix(nm): reload: only consider NM connections with a real interface
- fix(policy): warn instead of error for overlapping ports

Fabrizio D'Angelo (1):
- fix(ipset): fix hash:net,net functionality

Robert Richmond (1):
- fix(ipset): entry delete with timeout

Ye Shu (1):
- fix(applet): Show a basic tooltip instead of HTML

-----

Source available here:

 * Tarball: [firewalld-0.9.4.tar.gz](https://github.com/firewalld/firewalld/releases/download/v0.9.4/firewalld-0.9.4.tar.gz)
 * SHA256: 52c5e3d5b1e2efc0e86c22b2bc1f7fd80908cc2d8130157dc2a3517a59b0a760
 * Complete changelog on github: [0.9.3 to 0.9.4](https://github.com/firewalld/firewalld/compare/v0.9.3...v0.9.4)
