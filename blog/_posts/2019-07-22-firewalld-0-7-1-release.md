---
layout: post
title: "firewalld 0.7.1 release"
section: Blog
date: 2019-07-22T20:00:00
author: Eric Garver
category: release
---

A new release of firewalld, version 0.7.1, is available.

This is a bug fix only release.

- fix: firewall-offline-cmd: service: use dict based APIs
- fix: client: service: use dict based dbus APIs
- fix: dbus: new dict based APIs for services
- fix: dbus: add missing APIs for service includes
- fix: dbus: fix service API break
- fix: CLI: show service includes with --info-service

-----

Source available here:

 * Tarball: [firewalld-0.7.1.tar.gz](https://github.com/firewalld/firewalld/releases/download/v0.7.1/firewalld-0.7.1.tar.gz)
 * SHA256: 88bc63a011209ac046fb5d7bfc73ddcc0bc616ddf3013bbb6bf1a421cb497f76
 * Complete changelog on github: [0.7.0 to 0.7.1](https://github.com/firewalld/firewalld/compare/v0.7.0...v0.7.1)
