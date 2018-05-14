---
layout: page
title: "The daemon: firewalld"
---

firewalld is the firewall daemon. It provides a dynamically managed firewall with support for network/firewall “zones” to assign a level of trust to a network and its associated connections, interfaces or sources. It has support for IPv4, IPv6, Ethernet bridges and also for IPSet firewall settings. There is a separation of the runtime and permanent configuration options. It also provides an interface for services or applications to add iptables, ip6tables and ebtables rules directly. This interface can also be used by advanced users.

## Reload firewalld

To reload firewalld you can either use the command line tool `firewall-cmd --reload` or you can send the `SIGHUP` signal to firewalld for example with `killall -HUP firewalld`.

## Further information

Information about howto debug firewalld can be found in the howto section: [HowTo Debug firewalld](howto/debug-firewalld.html). Please also have a look at the [firewalld](man-pages/firewalld.html) man page.
