---
layout: post
title: "firewalld 0.4.3.2 release"
section: Blog
date: 2016-07-05T04:08:25
author: Thomas Woerner
category: release
---

The new firewalld version 0.4.3.2 is available as a bug fix only release for version 0.4.3.

The main changes are

**Fix regression with unavailable optional commands**

When a command is not available, new implementation to run a program raises an unexpected error which is not being handled by the callers. An emulation of the old behaviour has been added to fix this regression.

**Revert to individual calls on missing restore commands**

If iptables is available but not iptables-restore, then the transaction model was not able to apply firewall rules. With this change, individual calls will be used for missing restore commands. This applies to iptables, ip6tables and also ebtables.

**Only ask for authentication once for add and remove options**

With the use of the command backend a not authorized user was asked two times to authenticate for a query and later for the add or remove action that are done internally. With sequence options, the user was asked two times the number of options.

**New RH-Satellite-6 service**

The service has been included finally in the release. It does not need to be added in RHEL now.

***

The new firewalld version 0.4.3.2 is available here:

 * Tarball: [firewalld-0.4.3.2.tar.gz](https://github.com/firewalld/firewalld/archive/v0.4.3.2.tar.gz#/firewalld-0.4.3.2.tar.gz)
 * SHA256: 6a5ef24f5fde6dae105d575f0ef219c64d4bbefe2bf1dd024257903d2f5046b8
 * Source repository on github: [v0.4.3.2](https://github.com/firewalld/firewalld/releases/tag/v0.4.3.2)
 * Complete changelog on github: [0.4.3.1 to 0.4.3.2](https://github.com/firewalld/firewalld/compare/v0.4.3.1...v0.4.3.2)
