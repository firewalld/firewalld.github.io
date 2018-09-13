---
layout: post
title: "firewalld 0.5.5 release"
section: Blog
date: 2018-09-13T14:00:00
author: Eric Garver
category: release
---

A new release of firewalld, version 0.5.5, is available.

This is a bug fix only release.

- fw: if startup fails on reload, reapply non-perm config that survives reload
- fw: If direct rules fail to apply add a "Direct" label to error msg
- firewall/core/fw_nm: nm_get_zone_of_connection should return None or empty string instead of False
- update translations

-----

Source available here:

 * Tarball: [firewalld-0.5.5.tar.gz](https://github.com/firewalld/firewalld/archive/v0.5.5.tar.gz)
 * SHA256: 0b04d4d13f8b5ea6f971247f253c7620d0078fd8df465fcea0f8e44bd91c73ac
 * Complete changelog on github: [0.5.4 to 0.5.5](https://github.com/firewalld/firewalld/compare/v0.5.4...v0.5.5)
