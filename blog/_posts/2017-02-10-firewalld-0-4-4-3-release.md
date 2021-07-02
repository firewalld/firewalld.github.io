---
layout: post
title: "firewalld 0.4.4.3 release"
section: Blog
date: 2017-02-10T14:30:00
author: Thomas Woerner
category: release
---

The new firewalld version 0.4.4.3 is available as the third bug fix release for 0.4.4.

The main changes are

**Speed up of large file loading**

The loading of large config files has been optimized in the generic io handler. This results in a huge speed up for big config files.

**Support for more ipset types**

This is the list of ipset types that can now be managed by firewalld:

 * hash:ip
 * hash:ip,port
 * hash:ip,port,ip
 * hash:ip,port,net
 * hash:ip,mark
 * hash:net
 * hash:net,net
 * hash:net,port
 * hash:net,port,net
 * hash:net,iface
 * hash:mac

To speed up the generation and to simplifay the ipset generation in transactions, new checks have been added to be able to verify ipset entries according to the ipset type.

Currently there is no way to define how ipsets are used as sources, therefore only a limited list of ipset types can be used as sources in zones at the moment. These are:

 * hash:ip
 * hash:ip,port
 * hash:ip,mark
 * hash:net
 * hash:net,port
 * hash:net,iface
 * hash:mac

The source and destination flags for the ipset types parts will be added with a later release.

**Speed up of adding or removing entries for ipsets from files**

The file import has been optimized in several places: The loading of the import file, the checks on the imported entries, the way how entres from this file are added or removed and also the way how this is then imported into firewalld.

**Support icmp-type usage in rich rules**

ICMP types can now be used as elements in rich language rules. With this it is possible to have more fine grained ICMP type handling with the ability to combine them with an address, logging and also an action.

**Support for more icmp types**

This is the list of ICMP types that can now be used by firewalld for ICMP blocking and also in rich language rules:

    address-unreachable, bad-header, beyond-scope, communication-prohibited,
    failed-policy, fragmentation-needed, host-precedence-violation,
    host-prohibited, host-redirect, host-unknown, host-unreachable,
    ip-header-bad, neighbour-advertisement, neighbour-solicitation,
    network-prohibited, network-redirect, network-unknown, network-unreachable,
    no-route, packet-too-big, port-unreachable, precedence-cutoff,
    protocol-unreachable, reject-route, required-option-missing,
    source-route-failed, tos-host-redirect, tos-host-unreachable,
    tos-network-redirect, tos-network-unreachable, ttl-zero-during-reassembly,
    ttl-zero-during-transit, unknown-header-type, unknown-option

**Support for h323 conntrack helper**

The conntrack helper h323 can now be used with enabled and disabled automatic helper assignment. The helper is not diretly usable with disabled automatic helper assignment and therefore needs to be replaced by the helpers that the netfilter kernel module provides.

For disabled automatic helper assignment: If there are no helper ports defined in a firewalld helper configuration file, then firewalld tries to replace the helper with all the helpers that are provided by the netfilter helper module in the kernel. But only with the ones where a firewalld helper configuration exists. The H.245 helper is not usable right now because of an issue in the helper code in netfilter. Therefore there is no H.245 helper provided by firewalld at the moment as there is no way to properly detect a fixed version at the moment.

**New services**

freeipa-trust, mssql, kibana, elasticsearch, quassel, bitcoin-rpc, bitcoin-testnet-rpc, bitcoin-testnet, bitcoin and spideroak-lansync

**Code cleanup and several other bug fixes**


**Translation updates**

***

The new firewalld version 0.4.4.3 is available here:

 * Tarball: [firewalld-0.4.4.3.tar.gz](https://github.com/firewalld/firewalld/archive/v0.4.4.3.tar.gz#/firewalld-0.4.4.3.tar.gz)
 * SHA256: e31fad3fc987115cdde25a96c842baa321fb98a456cbab318ceed85642fee40c
 * Source repository on github: [v0.4.4.3](https://github.com/firewalld/firewalld/releases/tag/v0.4.4.3)
 * Complete changelog on github: [0.4.4.2 to 0.4.4.3](https://github.com/firewalld/firewalld/compare/v0.4.4.2...v0.4.4.3)
