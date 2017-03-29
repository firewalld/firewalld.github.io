---
layout: post
title: "firewalld 0.4.3.1 release"
section: Blog
date: 2016-06-28T08:24:07
author: Thomas Woerner
category: release
---

The new firewalld version 0.4.3.1 is available as a bug fix only release for version 0.4.3.

The main changes are

**Fixes missing ICMP rules for some zones**

The zone specific ICMP rules for ICMP block inversion have been missing in zones with bindings, that are defined in the zone configuration file.

**Fixes issue with running programs using Python3**

With using Python3 for firewalld, firewall rules have not been applied in some cases without an error message.

**Splits up source and destination address lists for transaction**

A direct rule could contain source and destination address lists. iptables splits them up to only contain one source and one destination address at maximum. This is also needed in firewalld especially with the transaction model that uses the restore commands.

**Completed firewallctl and firewallctl man page**

The firewallctl command line tool and also the man page of firewallctl have been completed.

There are also other bug fixes.

***

The new firewalld version 0.4.3.1 is available here:

 * Tarball: [firewalld-0.4.3.1.tar.gz](https://github.com/t-woerner/firewalld/archive/v0.4.3.1.tar.gz#/firewalld-0.4.3.1.tar.gz)
 * SHA256: afd73292eaab13e0e440e2b3a25faae3164a4776ed53f749a9123501b007704e
 * Source repository on github: [v0.4.3.1](https://github.com/t-woerner/firewalld/releases/tag/v0.4.3.1)
 * Complete changelog on github: [0.4.3 to 0.4.3.1](https://github.com/t-woerner/firewalld/compare/v0.4.3...v0.4.3.1)
