---
layout: page
title: "Concepts"
section: Documentation
--- 

firewalld has a two layer design: The core layer and the D-Bus layer on top. The core layer is responsible for handling the configuration and the back ends like iptables, ip6tables, ebtables, ipset and the module loader.

The firewalld D-Bus interface is the primary way to alter and create the firewall configuration. The interface is used by all firewalld provided online tools, like for example firewall-cmd, cirewallctl, firewall-config and firewall-applet. firewall-offline-cmd is not talking to firewalld, but altering and creating firewalld config files directly using the firewalld IO back ends. firewall-offline-cmd can be used while firewalld is running, but it is not recommended as it is only able to alter the permanent configuration.

More information on the firewalld D-Bus API is available [here](https://twoerner.fedorapeople.org/firewalld/doc/firewalld.dbus.html).

firewalld deoes not depend on NetworkManager, but the use is recommended. If NetworkManager is not used, there are some limitations: firewalld will not get notified about network device renames. If firewalld gets started after the network is already up, the connections and manually created interfaces are not bound to a zone. You can add them to a zone with firewall-cmd [--permanent] --zone=zone --add-interface=interface, but make sure that if there's a /etc/sysconfig/network-scripts/ifcfg-interface, the zone specified there with ZONE=zone is the same (or both are empty/missing for default zone), otherwise the behaviour would be undefined.


firewalld provides support for zones, services, ipsets and icmp types.

### Zones

A network or firewall zone defines the trust level of the interface used for a connection. There are several pre-defined zones provided by firewalld. Zone configuration options and generic information about zones are described in [firewalld.zone](https://twoerner.fedorapeople.org/firewalld/doc/firewalld.zone.html)

### Services

A service can be a list of local ports and destinations and additionally also a list of firewall helper modules automatically loaded if a service is enabled. Service configuration options and generic information about services are described in [firewalld.service](https://twoerner.fedorapeople.org/firewalld/doc/firewalld.service.html). The use of predefined services makes it easier for the user to enable and disable access to a service.

### ICMP types

The Internet Control Message Protocol (ICMP) is used to exchange information and also error messages in the Internet Protocol (IP). ICMP types can be used in firewalld to limit the exchange of these messages. For more information, please have a look at [firewalld.icmptype](https://twoerner.fedorapeople.org/firewalld/doc/firewalld.icmptype.html).

### IPSets

An ipset can be used to group several IP or MAC addresses together. An ipset for IP addresses is either usable for IPv4 or IPv6. This is defined by the family setting of the ipset. It can be either inet (the default) or inet6.

With the use of ipsets, the number of rules for black or white listing for example is reduced to only a few rules for a long list of addresses in the ipset. The numbre of needed rules depends on the use case.

### Runtime configuration

Runtime configuration is the actual active configuration and is not permanent. After reload/restart of the service or a system reboot, runtime settings will be gone if they haven't been also in permanent configuration.

### Permanent configuration

The permanent configuration is stored in config files and will be loaded and become new runtime configuration with every machine boot or service reload/restart.

### Direct interface

The direct interface is mainly used by services or applications to add specific firewall rules. It requires basic knowledge of ip(6)tables concepts (tables, chains, commands, parameters, targets).
