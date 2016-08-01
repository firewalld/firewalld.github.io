---
layout: post
title: "firewalld speed up"
section: Blog
date: 2016-01-07T11:15:08
author: Thomas Woerner
---

Since end of last year firewalld supports to use the restore commands of iptables, ip6tables and ebtables.This means that rules do not need to get applied one by one, but in bigger chunks. This results for example in a nice speed up of the firewalld start, reload, restart and stop.

The default rules are applied using these commands in one. The changes for example for services, ports etc. are applied per service, port etc. to be able to give feedback per item. Enabling or disabling single ports are therefore not sped up by this, but services using several ports are.

The use of the restore commands is also the base to be able to add direct rule sets, that are applied in one step as a whole.

The new setting <em>IndividualCalls</em> has been introduced to disable the use of the restore commands and to use iptables, ip6tables and ebtables individual calls per rule.

There are two limitations with using the restore commands:
<ul>
	<li>The restore commands in the iptables package need to extended to use the locking mechanism in xtables and ebtables to prevent clashes with concurrent calls of ip*tables and ebtables. Enabling IndividualCalls in the firewalld configuration file is helping here, but disables the use of the restore commands.</li>
	<li>The error reporting is a not as verbose as with single commands. An enhancement here is possible, but not to the same extend as with single calls.</li>
</ul>
