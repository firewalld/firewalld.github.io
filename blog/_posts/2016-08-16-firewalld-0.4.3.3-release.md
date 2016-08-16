---
layout: post
title: "firewalld 0.4.3.3 release"
section: Blog
date: 2016-08-16T04:46:59
author: Thomas Woerner
category: release
---

The new firewalld version 0.4.3.3 is available as a security and bug fix release for version 0.4.3.

The main changes are

**Fixes CVE-2016-5410**

Any locally logged in user, could add and remove tracked passthrough rules and could set ipset entries. On top of this the policy to get zone, service, .. settings and also the log denied value is more strict now.

**Standard error is now used for errors and warnings**

Errors and warnings can now simply be skipped for example while getting the default zone with the command line client by piping stderr to /dev/null.

**Several fixes for use in change roots**

The command line use in change roots is not resulting in trace backs anymore. The client class, NetworkManager backend and also the command line clients have been adapted for this.

**Systemd service file changes**

The systemd service has been changed that firewalld gets started before the network-pre.target and before multi-user.target.

**Fixed translations in firewall-config**

The translations in firewall-config hve not been correct at all times. The gettext textdomain was not set property which resulted in missing translations in the code.

**Command line clients**

Several error return code fixes have been added to fix the behavior with single and sequence options.

***

The new firewalld version 0.4.3.3 is available here:

 * Tarball: [firewalld-0.4.3.3.tar.bz2](https://fedorahosted.org/released/firewalld/firewalld-0.4.3.3.tar.bz2)
 * SHA1: 3d2aa97695f1c367def631c1ed9781c7ff127720
 * Source repository on github: [v0.4.3.3](https://github.com/t-woerner/firewalld/releases/tag/v0.4.3.3)
 * Complete changelog on github: [0.4.3.2 to 0.4.3.3](https://github.com/t-woerner/firewalld/compare/v0.4.3.2...v0.4.3.3)
