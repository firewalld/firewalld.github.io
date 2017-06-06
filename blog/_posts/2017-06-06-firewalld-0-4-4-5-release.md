---
layout: post
title: "firewalld 0.4.4.5 release"
section: Blog
date: 2017-06-06T17:45:00
author: Thomas Woerner
category: release
---

The new firewalld version 0.4.4.5 is available as the fourth bug fix release for 0.4.4.

The main changes are

**Fix build from spec**

The spec file still contained fedorahosted.org remains. These have been removed and the missing dependency for autotools has been added.

**Fix --remove-service-from-zone option**

The wrong option name has been used internally which resulted in the `NoneType object is not iterable error`.

**Support sctp and dccp in ports, source-ports, forward-ports, helpers and rich rules**

This patch adds support to use ports with the protocols sctp and dccp if also a port id is specified. The use of sctp and dccp is now also allowed in source-ports, forward-ports, helpers and rich language rules.

The test suite has been expanded to also test the new combinations.

This fixes RHBZ#1429808

**firewall-cmd: Fix --{set,get}-{short,description} for zone**

The options `--{set,get}-{short,description}` have been used on the wrong object in firewall-cmd which resulted in a back trace.

Fixes: RHBZ#1445238

**firewall.core.ipXtables: Use new wait option for restore commands if available**

The iptables restore commands in the next iptables release will support the wait option. This is very useful and results in less likely collisions with iptables commands used by other services or the user.

**New services**

ctdb, ovirt-imageio, ovirt-storageconsole, ovirt-vmconsole and nrpe

**Rename extension for policy choices (server and desktop) to .policy.choice**

firewalld provides a server and a desktop specific policy file. Both files are installed and the one to be used will be linked to 
`org.fedoraproject.FirewallD1.policy`. The existance of several policy files using the .policy extensionn in the policy directory could result in a policykit issue. Therefore the policy choice files are now using the extension .policy.choice. 

This is done at installation time to still use autofoo targets etc. A change in firewall-offline command to fix --policy-server and --policy-desktop options has been needed for this also.
    
This fixes RHBZ#1449754

**D-Bus interfaces: Fix GetAll for interfaces without properties**

The use of GetAll on D-Bus interfaces without properties restulted in the `FirewallD does not implement` the interface error. This has been fixed and an empty array is returned now.

The property handling code and also the error messages are now consisent in all D-Bus interfaces of firewalld.

This fixes RHBZ#1452017

**Load NAT helpers with conntrack helpers**

If a conntrack helper is used, then the NAT helper will automatically be loaded also if there is a matching NAT helper. New functionality to detect NAT helpers supported by the kernel has been added. The new property nf_nat_helpers has been added to the firewalld D-Bus interface.

Fixes: RHBZ#1452681

**Translation updates**

***

The new firewalld version 0.4.4.5 is available here:

 * Tarball: [firewalld-0.4.4.5.tar.gz](https://github.com/t-woerner/firewalld/archive/v0.4.4.5.tar.gz#/firewalld-0.4.4.5.tar.gz)
 * SHA256: 89419316e829a2cb086142acc4b1aeba45f20ecddf0ca236db5faf8ec8d12601
 * Source repository on github: [v0.4.4.5](https://github.com/t-woerner/firewalld/releases/tag/v0.4.4.5)
 * Complete changelog on github: [0.4.4.4 to 0.4.4.5](https://github.com/t-woerner/firewalld/compare/v0.4.4.4...v0.4.4.5)
