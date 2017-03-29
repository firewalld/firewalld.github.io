---
layout: post
title: "firewalld 0.4.1.2 release"
section: Blog
date: 2016-04-20T04:50:46
author: Thomas Woerner
category: release
---

The new firewalld version 0.4.1.2 is available with enhancements, bug fixes and speed ups.

The main changes are

**ipset handling enhancements**

No cleanup of ipsets using timeouts while reloading.

Only destroy ipsets with the same name and a conflicting type or conflicting options.

Use ipset types that are supported by the system.

**Add and remove several ipset entries in one call using a file**

The new options  for firewall-cmd are --add-entries-from-file and --remove-entries-from-file.

**Reduced time frame where builtin chains are on policy DROP while reloading**

All config files are read before the rule set will be created. This is good on slower machines and also reduced the possibility of packet losses while reloading.

**Command line interface support to get and alter descriptions**

The new options for firewall-cmd and firewall-offline-cmd are --set-description, --get-description, --set-short and --get-short for zones, services, ipsets and icmptypes.

**Fixed logging in rich rule forward rules**

**Rework of import structures**

**Reduced calls to get ids for port and protocol names**

**NetworkManager module**

This module is used to get and set zones of connections, used in firewall-applet and firewall-config.

**Autodetection of  backend tools in configure**

The {ip,ip6,eb}tables{,-restore} and ipset backend tools are discovered in the build process to use a proper path automatically. The with options for these tools in configure are still usable for overloading.

**D-Bus properties in introspection data**

The D-Bus properties are now part of the introspection data and are now visible in D-Bus viewers and debuggers.

There are also several bug fixes and further code optimizations.

***

The new firewalld version 0.4.1.2 is available here:

 * Tarball: [firewalld-0.4.1.2.tar.gz](https://github.com/t-woerner/firewalld/archive/v0.4.1.2.tar.gz#/firewalld-0.4.1.2.tar.gz)
 * SHA256: fa818f2bf6a500cd81968db0ab8c6220a74b78c3a3fc4b2d7663daed003b6a34
 * Source repository on github: [v0.4.1.2](https://github.com/t-woerner/firewalld/releases/tag/v0.4.1.2)
 * Complete changelog on github: [0.4.1.1 to 0.4.1.2](https://github.com/t-woerner/firewalld/compare/v0.4.1.2...v0.4.1.2)
