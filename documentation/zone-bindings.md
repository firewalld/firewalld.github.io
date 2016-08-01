---
layout: page
title: "Zone bindings"
section: Documentation
--- 

## How to set or change a zone for a connection

The zone is stored into the ifcfg of the connection with the ZONE= option. If the option is missing or empty, the default zone set in firewalld is used.

If the connection is controlled by NetworkManager, you can also use nm-connection-editor to change the zone.

## Network connections handled by NetworkManager

The firewall is not able to handle network connections with the name shown by NetworkManager, it can only handle network interfaces. Therefore NetworkManager tells firewalld to put the network interfaces related to the connections in the zones defined by the config file (ifcfg) of the connection before the connection comes up. If the zone is not set in the config file, the interfaces will be put in the default zone set by firewalld. If a connection has more than one interfaces, both will be supplied to firewalld. Also changes in the names of interfaces will be handled by NetworkManager and supplied to firewalld.

To simplify this connections will be used as related to zones from now on.

NetworkManager also tells firewalld to remove connections from zones again if the connection went down.

If firewalld gets started or restarted by systemd or init scripts, firewalld notifies NetworkManager and the connections will be added to the zones.

## Network connections handled by network scripts

For connections handled by network scripts there a limitations: There is no daemon that can tell firewalld to add connections to zones. This is done in the ifcfg-post script only. Therefore changes in names after this can not be supplied to firewalld. Also starting or restarting firewalld if the connections are active already results in the loss of the relation. There are ideas to fix this also. The simplest is to push all connections to the default zone that are not set otherwise.

The zone defines the firewall features that are enabled in this zone.
