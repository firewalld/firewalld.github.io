---
layout: post
title: "firewalld 0.4.2 release"
section: Blog
date: 2016-05-30T06:28:53
author: Thomas Woerner
category: release
---

The new firewalld version 0.4.2 is available with enhancements, bug fixes and very nice speed ups.

The main changes are

**New transaction model**

Changes are done in one big transaction instead of smaller ones. This speeds up firewalld start and restart tremendously.
The start is done up to in six or nine calls to the restore commands depending on the configuration. This depends on ipset and also direct configuration usage.
Also all other actions benefit from this change.

**Enhanced handling of connections and interfaces**

For interfaces that are handled by NetworkManager, requests to add or change bindings are directed to NetworkManager in the firewall-cmd and firewall-config tools.
For interfaces on Fedora and RHEL systems that are not handled by NM, there is a new mechanism that changes the ifcfg file if there is one using the interface.
This makes zone interface bindings more consistent.

**Usability enhancements for firewall-config**

firewall-config has a new side bar with the active bindings of connections, interfaces and also sources. With this side bar it is possible to change the binding assignments in a simple way.
A new overlay message window if the connection to firewalld could not be established or if it is lost.
Speed ups for view changes runtime to permanent and back by introduction of new D-Bus methods in firewalld.
The resize behavior has been fixed to be more expected.

**Enhanced runtime to permanent migration**

The enhanced migration is not saving interfaces that are under control of NetworkManager to the permanent configuration. Zones, services etc. are only migrated if there are changes compared to current permanent configuration.

**New ICMP block inversion**

The ICMP block is now completely handled per zone. With the new ICMP block inversion flag in the zone it is possible to invert the ICMP block. That means that the enabeld ICMP blocks are allowed and all others are blocked. In a drop zone these remaining types are dropped and not blocked.
The logging of denied rules have been added to icmp-blocks.

**Source port support in zones, services and rich rules**

Additionally to ports is it also now possible to allow source ports in a zones and also in a service in a similar way as existing ports. There is a new flag source-port for this.
Source ports can also be used in rich rules as elements. The source ports can be combined with logging, limiting and also an action.

**Rich rules with destination only**

Destination addresses can now be used in rich rules without an element. This enabled the use of rich rules containing destination addresses combined with an action and logging only.

There are also several other bug fixes or enhancements and code optimizations.

***

The new firewalld version 0.4.2 is available here:

 * Tarball: [firewalld-0.4.2.tar.gz](https://github.com/firewalld/firewalld/archive/v0.4.2.tar.gz#/firewalld-0.4.2.tar.gz)
 * SHA256: e127bff64f6e7c242668a971674f5f075657fc5110a6ab363129be243885f938
 * Source repository on github: [v0.4.2](https://github.com/firewalld/firewalld/releases/tag/v0.4.2)
 * Complete changelog on github: [0.4.1.2 to 0.4.2](https://github.com/firewalld/firewalld/compare/v0.4.1.2...v0.4.2)
