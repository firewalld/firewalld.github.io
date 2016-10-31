
---
layout: post
title: "Automatic Helper Assignment"
section: Blog
date: 2016-10-31T15:34:31
author: Thomas Woerner
---

With kernel 4.7 and up the automatic helper assignment in kernel has been turned off by default. Netfilter conntrack helpers like for example nf_conntrack_ftp now need to be used in a different way. See https://home.regit.org/netfilter-en/secure-use-of-helpers/

The new AutomaticHelpers configuration setting has been added to firewalld.conf:

<pre>
# AutomaticHelpers
# For the secure use of iptables and connection tracking helpers it is
# recommended to turn AutomaticHelpers off. But this might have side effects on
# other services using the netfilter helpers as the sysctl setting in
# /proc/sys/net/netfilter/nf_conntrack_helper will be changed.
# With the system setting, the default value set in the kernel or with sysctl
# will be used. Possible values are: yes, no and system.
# Default: system
AutomaticHelpers=system
</pre>

firewalld is now checking the `/proc/sys/net/netfilter/nf_conntrack_helper` kernel setting at start. With **AutomaticHelpers** set to *system*, this is the default, firewalld will use the actual setting in the kernel. This could wither be the default in the kernel itself or has been set using sysctl.

If automatic helper assignment is turned off, firewalld will create rules in the PREROUTING chain of the raw table to enable the helper for the zone, where it is used. For this it uses the helper settings defined in the new helpers. These are the nf_conntrack_ module that provides the helper, the optional family if a helper could only be used for IPv4 or IPv6 and also the ports. The helper will only listen on the ports defined in the helper configuration. If there is a need to modify these ports, 
then it is possible to create an adapted configruaiton either with the GUI or command line tools or by copying the file to `/etc/firewalld/helpers`. If you want to change the protocol, please make sure that the helper is able to use this protocol. There is only a limited amount of helpers that are abel to handle more than one protocol.

Here is an eample of the ftp helper added by enabling the ftp service in the public zone:

<pre>
# iptables -t raw -S | grep CT
-A PRE_public_allow -p tcp -m tcp --dport 21 -j CT --helper ftp
</pre>

A new backend has been added, the D-Bus interface has been extended, also the GUI and command line tools and the documentation.
