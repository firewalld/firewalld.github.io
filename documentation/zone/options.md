---
layout: page
title: "Options"
---

The zone configuration can contain these tags and attributes. Some of them are mandatory, others optional.

## zone

The mandatory zone start and end tag defines the zone. This tag can only be used once in a zone configuration file. There are optional attributes for zones:

    version="string"

To give the zone a version.

    target="ACCEPT|%%REJECT%%|DROP"

Can be used to accept, reject or drop every packet that doesn't match any rule (port, service, etc.). The `ACCEPT` target is used in trusted zone to accept every packet not matching any rule. The `%%REJECT%%` target is used in block zone to reject (with default firewalld reject type) every packet not matching any rule. The `DROP` target is used in drop zone to drop every packet not matching any rule. If the target is not specified, every packet not matching any rule will be rejected.

## short

Is an optional start and end tag and is used to give a zone a more readable name.

## description

Is an optional start and end tag to have a description for a zone.

## interface

Is an optional empty-element tag and can be used several times. It can be used to bind an interface to a zone. You don't need this for NetworkManager-managed interfaces, because NetworkManager binds interfaces to zones automatically. See also ['How to set or change a zone for a connection?'](../man-pages/firewalld.zones.html#howtosetorchangeazone) in [firewalld.zones(5)](../man-pages/firewalld.zones.html). You can use it as a fallback mechanism for interfaces that can't be managed via NetworkManager. An interface entry has exactly one attribute:

    name="string"

The name of the interface to be bound to the zone.

## source

Is an optional empty-element tag and can be used several times. It can be used to bind a source address, address range, a MAC address or an ipset to a zone. A source entry has exactly one of these attributes:

    address="address[/mask]"

The source is either an IP address or a network IP address with a mask for IPv4 or IPv6. The network family (IPv4/IPv6) will be automatically discovered. For IPv4, the mask can be a network mask or a plain number. For IPv6 the mask is a plain number. The use of host names is not supported.

    mac="MAC"

The source is a MAC address. It must be of the form `XX:XX:XX:XX:XX:XX`.

    ipset="ipset"

The source is an ipset.

## service

Is an optional empty-element tag and can be used several times to have more than one service entry enabled. A service entry has exactly one attribute:

    name="string"

The name of the service to be enabled. To get a list of valid service names `firewall-cmd --list=services` can be used.

## port

Is an optional empty-element tag and can be used several times to have more than one port entry. All attributes of a port entry are mandatory:

    port="portid[-portid]"

The port can either be a single port number portid or a port range portid-portid.

    protocol="tcp|udp"

The protocol can either be tcp or udp.

## protocol

Is an optional empty-element tag and can be used several times to have more than one protocol entry. All protocol has exactly one attribute:

    value="string"

The protocol can be any protocol supported by the system. Please have a look at /etc/protocols for supported protocols.

## icmp-block

Is an optional empty-element tag and can be used several times to have more than one icmp-block entry. Each icmp-block tag has exactly one mandatory attribute:

    name="string"

The name of the Internet Control Message Protocol (ICMP) type to be blocked. To get a list of valid ICMP types `firewall-cmd --list=icmptypes` can be used.

## icmp-block-inversion

Is an optional empty-element tag and can be used only once in a zone configuration. This flag inverts the icmp block handling. Only enabled ICMP types are accepted and all others are rejected in the zone.

## masquerade

Is an optional empty-element tag. It can be used only once in a zone configuration and is not usable for IPv6. If it's present masquerading is enabled for the zone. If you want to enable masquerading, you should enable it in the zone bound to the external interface.

## forward-port

Is an optional empty-element tag and can be used several times to have more than one port or packet forward entry. This is for IPv4 only. Use rich language rules for IPv6. There are mandatory and also optional attributes for forward ports:

### Mandatory attributes:

The local port and protocol to be forwarded.

    port="portid[-portid]"

The port can either be a single port number portid or a port range portid-portid.

    protocol="tcp|udp"

The protocol can either be tcp or udp.

### Optional attributes:

The destination of the forward. For local forwarding add to-port only. For remote forwarding add to-addr and use to-port optionally if the destination port on the destination machine should be different.

    to-port="portid[-portid]"

The destination port or port range to forward to. If omitted, the value of the port= attribute will be used altogether with the to-addr attribute.

    to-addr="address"

The destination IPv4 IP address.

## source-port

Is an optional empty-element tag and can be used several times to have more than one source port entry. All attributes of a source port entry are mandatory:

    port="portid[-portid]"

The port can either be a single port number portid or a port range portid-portid.

    protocol="tcp|udp"

The protocol can either be tcp or udp.

## rule

Is an optional element tag and can be used several times to have more than one rich language rule entry.

The general rule structure:

    <rule [family="ipv4|ipv6"]>
      [ <source address="address[/mask]" [invert="True"]/> ]
      [ <destination address="address[/mask]" [invert="True"]/> ]
      [
        <service name="string"/> |
        <port port="portid[-portid]" protocol="tcp|udp"/> |
        <protocol value="protocol"/> |
        <icmp-block name="icmptype"/> |
        <masquerade/> |
        <forward-port port="portid[-portid]" protocol="tcp|udp" [to-port="portid[-portid]"] [to-addr="address"]/> |
        <source-port port="portid[-portid]" protocol="tcp|udp"/> |
      ]
      [ <log [prefix="prefixtext"] [level="emerg|alert|crit|err|warn|notice|info|debug"]/> [<limit value="rate/duration"/>] </log> ]
      [ <audit> [<limit value="rate/duration"/>] </audit> ]
      [
        <accept> [<limit value="rate/duration"/>] </accept> |
        <reject [type="rejecttype"]> [<limit value="rate/duration"/>] </reject> |
        <drop> [<limit value="rate/duration"/>] </drop> |
        <mark set="mark[/mask]"> [<limit value="rate/duration"/>] </mark>
      ]
    </rule>

Rule structure for source black or white listing:

    <rule [family="ipv4|ipv6"]>
      <source address="address[/mask]" [invert="True"]/>
      [ <log [prefix="prefixtext"] [level="emerg|alert|crit|err|warn|notice|info|debug"]/> [<limit value="rate/duration"/>] </log> ]
      [ <audit> [<limit value="rate/duration"/>] </audit> ]
      <accept> [<limit value="rate/duration"/>] </accept> |
      <reject [type="rejecttype"]> [<limit value="rate/duration"/>] </reject> |
      <drop> [<limit value="rate/duration"/>] </drop>
    </rule>

For a full description on rich language rules, please have a look at [firewalld.richlanguage(5)](../man-pages/firewalld.richlanguage.html).

