---
layout: post
title: "firewalld 0.9.1 release"
section: Blog
date: 2020-10-01T13:00:00
author: Eric Garver
category: release
---

A new release of firewalld, version 0.9.1, is available.

This is a bug fix only release.

Eric Garver (3):
- docs(firewall-cmd): clarify lockdown whitelist command paths
- fix(dbus): getActivePolicies shouldn't return a policy if a zone is not active
- fix(policy): zone interface/source changes should affect all using zone

-----

Source available here:

 * Tarball: [firewalld-0.9.1.tar.gz](https://github.com/firewalld/firewalld/releases/download/v0.9.1/firewalld-0.9.1.tar.gz)
 * SHA256: 7e3db6ed84919dd10add39cc7a28d97b5a9e27a53aeb73abf8af01ef082b74f9
 * Complete changelog on github: [0.9.0 to 0.9.1](https://github.com/firewalld/firewalld/compare/v0.9.0...v0.9.1)
