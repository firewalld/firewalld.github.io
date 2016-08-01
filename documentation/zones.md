---
layout: page
title: "Zones"
section: Documentation
--- 

A network zone defines the level of trust for network connections. This is a one to many relation, which means that a connection can only be part of one zone, but a zone can be used for many network connections.

### Predefined services

A service is a combination of port and/or protocol entries. Optionally netfilter helper modules can be added and also a IPv4 and IPv6 destination address.

### Ports, source ports and protocols

Definition of tcp or udp ports, where ports can be a single port or a port range.

### ICMP blocks

Selected Internet Control Message Protocol (ICMP) messages. These messages are either information requests or created as a reply to information requests or in error conditions.

### Masquerading

The addresses of a private network are mapped to and hidden behind a public IP address. This is a form of address translation.

### Forward ports

A port is either mapped to another port and/or to another host.


## Which zones are available?

These are the zones provided by firewalld sorted according to the default trust level of the zones from untrusted to trusted:

### drop

Any incoming network packets are dropped, there is no reply. Only outgoing network connections are possible.

### block

Any incoming network connections are rejected with an icmp-host-prohibited message for IPv4 and icmp6-adm-prohibited for IPv6. Only network connections initiated within this system are possible.

### public

For use in public areas. You do not trust the other computers on networks to not harm your computer. Only selected incoming connections are accepted.

### external

For use on external networks with masquerading enabled especially for routers. You do not trust the other computers on networks to not harm your computer. Only selected incoming connections are accepted.

### dmz

For computers in your demilitarized zone that are publicly-accessible with limited access to your internal network. Only selected incoming connections are accepted.

### work

For use in work areas. You mostly trust the other computers on networks to not harm your computer. Only selected incoming connections are accepted.

### home

For use in home areas. You mostly trust the other computers on networks to not harm your computer. Only selected incoming connections are accepted.

### internal

For use on internal networks. You mostly trust the other computers on the networks to not harm your computer. Only selected incoming connections are accepted.

### trusted

All network connections are accepted.


## Which zone should be used?

A public WIFI network connection for example should be mainly untrusted, a wired home network connection should be fairly trusted. Select the zone that best matches the network you are using. 

## How to configure or add zones?

To configure or add zones you can either use one of the firewalld interfaces to handle and change the configuration. These are the graphical configuration tool firewall-config, the command line tool firewall-cmd or the D-BUS interface. Or you can create or copy a zone file in one of the configuration directories. @PREFIX@/lib/firewalld/zones is used for default and fallback configurations and /etc/firewalld/zones is used for user created and customized configuration files.
