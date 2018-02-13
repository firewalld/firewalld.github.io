---
layout: page
title: "Connections, Interfaces and Sources"
---

It is possible to assign (or bind) zones to connections, interfaces and source addresses.

## How to set or change a zone for a connection

On systems supporting ifcfg files for interfaces, the zone could be stored in the ifcfg with the ZONE= option. If the option is missing or empty, the default zone set in firewalld is used.

If the connection is controlled by NetworkManager, you can also use nm-connection-editor to change the zone.

## Network connections handled by NetworkManager

The firewall in the Linux kernel is not able to handle network connections with the name shown by NetworkManager, it can only handle the network interfaces used by the connection. Because of this NetworkManager tells firewalld to assign the network interface that is used for this connection to the zone defined in the configuration of that connection. This assignment happens before the interface is used. The configuration of the connection can either be the NetworkManager configuration or also an ifcfg for example. If the zone is not set in the configuration file, the interfaces will be assigned to the default zone defined in the firewalld configuration. If a connection has more than one interface, all of them will be supplied to firewalld. Also changes in the names of interfaces will be handled by NetworkManager and supplied to firewalld.

To simplify this connections will be used as assigned to zones in this documentation.

NetworkManager also tells firewalld to unassign connections from zones again if the connection went down.

If firewalld gets started or restarted by systemd or init scripts, NetworkManager get notified and the connections will be assigned to the zones according to the scheme above.

## Network connections handled by network scripts

For connections handled by network scripts there a limitations: There is no daemon that can tell firewalld to add connections to zones. This is done in the ifcfg-post script only. Therefore changes in names after this can not be supplied to firewalld. Also starting or restarting firewalld if the connections are active already results in the loss of the relation. There are ideas to fix this also. The simplest is to push all connections to the default zone that are not set otherwise.

The zone defines the firewall features that are enabled in this zone.
