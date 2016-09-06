---
layout: post
title: "firewalld 0.4.3 release"
section: Blog
date: 2016-06-23T04:35:12
author: Thomas Woerner
category: release
---

The new firewalld version 0.4.3 is available with mostly bug fixes and some usability enhancements.

The main changes are

**Add and remove several ipset entries with firewall-config**

The graphical configuration tool firewall-config now also has the ability to add and remove ipset entries loaded from a file. This is the same as the the command line options --add-entries-from-file and --remove-entries-from-file. This is possible in the runtime and also to the permanent environment.

**Create backup on removal of zones, services, ipsets and icmptypes**

The configuration of a zone, service, ipset or icmptype is now preserved in a backup file on removal. The backup file has an additional ".old" extension. This makes it possible to manually undo removals.

**Additional information zone handling with NetworkManager and ifcfg files**

With version 0.4.2 the zone handling with NetworkManager and ifcfg files has ben changed to be more expected. Information about this hndling has been added to the firewalld and zone man pages.

**Sequence options in all command line utilities**

All command line utilities now support sequence options. It is now for example simply possible to add, remove and query several services in a zone.

**New firewallctl command line utility**

The new command line utility is an addition to the existing firewall-cmd and firewall-offline-cmd tools. It provides an other interface with shorter names.

**Updated and new services**

The high-availability service now also opens the port 5403/tcp for corosync-qnetd.

The new services are: kshell, rsh, ganglia-master and ganglia-client

**Test suite enhancements**

There are other bug fixes and also code clean ups.

***

The new firewalld version 0.4.3 is available here:

 * Tarball: [firewalld-0.4.3.tar.bz2](https://fedorahosted.org/released/firewalld/firewalld-0.4.3.tar.bz2)
 * SHA1: 37bd75cbfae9fc7a9785a6f4018816d7b864d8e2
 * Source repository on github: [v0.4.3](https://github.com/t-woerner/firewalld/releases/tag/v0.4.3)
 * Complete changelog on github: [0.4.2 to 0.4.3](https://github.com/t-woerner/firewalld/compare/v0.4.2...v0.4.3)
