---
layout: post
title: "firewalld 0.4.4.2 release"
section: Blog
date: 2016-12-01T15:30:07
author: Thomas Woerner
category: release
---

The new firewalld version 0.4.4.2 is available as a second bug fix release for 0.4.4.

The main changes are

**Lazy NMClient creation**

The NMClient creation is now delayed till it is really used. With firewalld version 0.4.4 it has been created at import time of the fw_nm module, which could result in a start issue with NetworkManager.

**Use configure for kmod utils path detection**

The kmod utils are not placed in the paths for all distributions. The tools and their path is now detected within the configure call.

**Enhancements and fixes for the ifcfg io backend**

The ifcfg io file backend is now properly hadnling quoted values and is not failing on shell script code in the ifcfg file.

**Do not reset ZONE with ifdown and enabled network service**

On reboot or shutdown the zone has been reset to default in an ifcfg file if the network service was enabled and controlling the interface.
    
The call of `firewall-cmd --remove-interface` in `ifdown.post` is now only removing the zone binding in the firewall, but not modifying the ifcfg file anymore.
    
**Translation updates**

***

The new firewalld version 0.4.4.2 is available here:

 * Tarball: [firewalld-0.4.4.2.tar.gz](https://github.com/firewalld/firewalld/archive/v0.4.4.2.tar.gz#/firewalld-0.4.4.2.tar.gz)
 * SHA256: 9df21f7fae253fe4f388f7fd46abe43cec527e4e0ec8f8d0db0a189673d13cf3
 * Source repository on github: [v0.4.4.2](https://github.com/firewalld/firewalld/releases/tag/v0.4.4.2)
 * Complete changelog on github: [0.4.4.1 to 0.4.4.2](https://github.com/firewalld/firewalld/compare/v0.4.4.1...v0.4.4.2)
