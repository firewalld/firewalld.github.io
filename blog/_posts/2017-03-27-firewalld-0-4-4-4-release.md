---
layout: post
title: "firewalld 0.4.4.4 release"
section: Blog
date: 2017-03-27T19:10:00
author: Thomas Woerner
category: release
---

The new firewalld version 0.4.4.4 is available as a third bug fix release for 0.4.4.

The main changes are

**Drop all references to fedorahosted.org**

fedorahosted.org has been shut down. The spec file and Makefile.am has been adapted to use the archive from the github repo instead.

**Fix inconsistent order of source bindings**

The order of zones has been inconsistent since the transaciton model has been introduced. This also resulted in inconsistent ordering of source bindings in the `INPUT_ZONE_SOURCE` chain.

The load order of zones is now preserved by using a dictionary that preserves the order of the added items.

This fixes issue #166 and RHBZ#1421222

**Fix ipset overloading from /etc/firewalld/ipsets**

The overloading of ipsets from /etc/firewalld/ipsets has been broken with version 0.4.4.3. The check if an ipset has been applied already is used only now if ipsets are about to get modified.

This fixes RHBZ#1423941.

**Fix permanent rich rules using icmp-type elements**

Rich language rules using the icmp-type element have not been saved properly. The code to handle the icmp-type element in the zone writer has been missing and this has only been logged as a warning. An element without name has been created because of this. This resulted in a corrupt zone file.

The code to handle the icmp-type element has been added and the warning for an unknown element has been transformed into a FirewallError. A curruption of the zone file can not happen anymore with an unhandled element.

This fixes RHBZ#1434763.

**Check if ICMP types are supported by kernel**

The supported ICMP types are now gathered from the kernel to be able to check the types before trying to use them. This helps to preserve the speed with the transaction model.

This is related to RHBZ#1401978.

**Show icmptypes and ipsets with type errors in permanent environment**

Type errors for ipsets and icmptypes resulted in a load failure while loading the config file. The type are occuring if an invalid type is used or if the type is not supported be the kernel.

These ipsets and icmptypes have been invisible in the runtime and also in the permanent environment. This has been fixed and these items are now visible in the permanent environment to be able to edit them.

**firewall-config: Show invalid ipset types**

Invalid ipset types are now shown in the ipset configuration dialog in the permanent environment in a special label.

**firewall-config: Deactivate modify buttons if there are no items**

Deactivate the edit and remove buttons for zones, services, ipsets, icmptypes and helpers if there are no items in the list.

***

The new firewalld version 0.4.4.4 is available here:

 * Tarball: [firewalld-0.4.4.4.tar.gz](https://github.com/t-woerner/firewalld/archive/v0.4.4.4.tar.gz#/firewalld-0.4.4.4.tar.gz)
 * SHA256: 8726bb7c15c180191b81764072041bebd371664fcbc25a0eafffc35c707b3df9
 * Source repository on github: [v0.4.4.4](https://github.com/t-woerner/firewalld/releases/tag/v0.4.4.4)
 * Complete changelog on github: [0.4.4.3 to 0.4.4.4](https://github.com/t-woerner/firewalld/compare/v0.4.4.3...v0.4.4.4)
