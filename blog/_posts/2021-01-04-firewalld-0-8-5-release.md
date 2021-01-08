---
layout: post
title: "firewalld 0.8.5 release"
section: Blog
date: 2021-01-04T18:00:00
author: Eric Garver
category: release
---

**Warning**: This release introduced a regression that caused a significant
increase in memory usage. However, functionality appears okay. If memory usage
is a concern then this release should be avoided.

A new release of firewalld, version 0.8.5, is available.

This is a bug fix only release. This is the last release for the `stable-0.8`
branch.

Donald Yandt (1):
- docs(dbus): fix invalid method names

Vrinda Punj (1):
- fix(rich): non-printable characters removed from rich rules

diegoe (1):
- docs(firewall-cmd): small description grammar fix

-----

Source available here:

 * Tarball: [firewalld-0.8.5.tar.gz](https://github.com/firewalld/firewalld/releases/download/v0.8.5/firewalld-0.8.5.tar.gz)
 * SHA256: fae8e1b45ff88fb6190fa71e8a8cece210ee2995f1a267504d74bbeddb4f933c
 * Complete changelog on github: [0.8.4 to 0.8.5](https://github.com/firewalld/firewalld/compare/v0.8.4...v0.8.5)
