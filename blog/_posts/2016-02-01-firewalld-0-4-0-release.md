---
layout: post
title: "firewalld 0.4.0 release"
section: Blog
date: 2016-02-01T10:46:24
author: Thomas Woerner
category: release
---

The new firewalld version 0.4.0 is available with amazing new features like ipset support, MAC address support, logging of denied packets, enhancements and speed ups.

The main changes are

**Speed ups**

The load, reload, restart and stop of firewalld ha sbeen sped up a lot by enabling the use of the restore commands of iptables, ip6tables and ebtables. Rules are now applied in bigger chunks, which speeds up all actions of firewalld that are changing firewall rules in netfilter.

The new setting IndividualCalls has been added to firewalld.conf. The setting defaults to no, which enabled the use of the restore commands.

The use of the restore commands might not fit all needs and is also resulting in less detailed error messages. Additionally the restore commands are not supporting the locking mechanisms. If the use of the restore commands is not possible for the use case, then the  IndividualCalls settiung should be enabled.

The use of ebtables-restore is limited to future versions, that will support the --noflush option. This option has already been added to the upstream git repository, but is not part of a release, yet.

**ipset support**

ipsets can now be used as zone bindings and also in rich rules.

firewalld supports initially the use of hash:ip, hash:net and hash:mac types. The use of ipsets with timeout is also possible, but the entries in the ipset then need to be taken care directly with ipset.

For simple black and white listing the use of ipsets is recommended altogether with rich rules.

**MAC address support**

MAC addresses can now also be used directly for zone bindings and in rich rules. A use of MAC addresses in ipsets is also possible.

**Log of denied packets**

The new LogDenied setting has been added to firewalld.conf. It can be altered with the command line tools and also firewall-config.

If LogDenied is enabled, logging rules right before reject and drop rules in the INPUT, FORWARD and OUTPUT chains for the default rules and also final reject and drop rules in zones. Possible values for LogDenied are: all, unicast, broadcast, multicast and off.

**Mark action in rich rules**

With the mark action it is now possible to mark packets matching the rich rule parameters.

The mark action results in -j MARK --set-xmark &lt;mark&gt; in the PREROUTING chain in the mange table to be able to affect routing with iproute.

**Enhanced alteration of config files with command line tools**

The permanent zone, service, icmptype and ipset config files can now directly be edited with the command line tools firwall-cmd and firewall-offline-cmd.

**Use of zone chains in direct interface**

The use of zone specific log, deny and allow chains is now possible in direct rules and tracked passthrough rules.

The needed parts of the zone structure are created on reload if one of the zone chains is used in the direct interface. The remaining parts of the zone are created as soon as it is used with a binding of if it is the default zone.</p>

**firewall-applet**

The firewall-applet has been further extended after the Qt migration and now supports the same functionality as the Gtk version before and even a bit more.

It provides now a global settings file in /etc/firewall/applet.conf and also a user settings file in $HOME/.config/firewall/applet.conf

**New services**

The services ceph-mon, ceph, docker-registry, imap, pop3, pulseaudio, smtps, snmptrap, snmp, syslog-tls and syslog have been added.

There are also several bug fixes and further code optimizations.

***

The new firewalld version 0.4.0 is available here:

 * Tarball: [firewalld-0.4.0.tar.gz](https://github.com/firewalld/firewalld/archive/v0.4.0.tar.gz#/firewalld-0.4.0.tar.gz)
 * SHA256: 97f13b9fe28d7be7726ecc7d09a2ec85d47efade9859d0d0e37f426bc142f64b
 * Source repository on github: [v0.4.0](https://github.com/firewalld/firewalld/releases/tag/v0.4.0)
 * Complete changelog on github: [0.3.14.2 to 0.4.0](https://github.com/firewalld/firewalld/compare/v0.3.14.2...v0.4.0)
