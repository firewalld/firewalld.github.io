---
layout: post
title: "firewalld 0.4.4 release"
section: Blog
date: 2016-10-31T15:49:10
author: Thomas Woerner
category: release
---

The new firewalld version 0.4.4 is available as an enhancement and bug fix release.

The main changes are

**Support Recognition of Automatic Helper Assignment Setting**

Automatic helper assignment has been disabled in kernel 4.7. firewalld version 0.4.4 is now able to recognize this and to create rules if automatic helper assignment has been turned off to make conntrack helpers work again. If automatic helper assignment is turned on, then firewalld will behave as before.

For more information about the use of netfilter conntrack helper, please have a look at [Automatic Helper Assignment](http://www.firewalld.org/2016/10/automatic-helper-assignment)

**Firewall-applet is now using Qt5**

The firewall applet has been ported from Qt4 to Qt5.

**Fixes LogDenied for zone reject targets**

The logging rules for LogDenied have been placed after the reject rules for zones using the reject targets. The logging rules are now placed before these reject rules to fix logging.

**Does not abort transaction on failed ipv6_rpfilter rules**

The existing transaction will be executed before trying to add the rules for ipv6_rpfilter and a new transaction will be used to apply the ipv6_rpfiler rules. If this transaction fails, a warning is printed out and the remaining rules are applied with the next transaction.

**Enhancements for the command line tools**

The command line tools are now more consistent with errors and error codes in sequence options. The NOT_AUTHORIZED error is now also working.

**New services**

The services cfengine, condor-collector and smtp-submission have been added.

**Several other enhancements and fixes**

***

The new firewalld version 0.4.4 is available here:

 * Tarball: [firewalld-0.4.4.tar.bz2](https://fedorahosted.org/released/firewalld/firewalld-0.4.4.tar.bz2)
 * SHA1: a3dc95ccad8bd4021a1f781a092801ba3bdccf96
 * Source repository on github: [v0.4.4](https://github.com/t-woerner/firewalld/releases/tag/v0.4.4)
 * Complete changelog on github: [0.4.3.3 to 0.4.4](https://github.com/t-woerner/firewalld/compare/v0.4.3.3...v0.4.4)
