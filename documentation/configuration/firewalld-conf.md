---
layout: page
title: "firewalld.conf"
---

The firewalld.conf file in `/etc/firewalld` provides the base configuration for firewalld. If it is absent or if `/etc/firewalld` is missing, the firewalld internal defaults will be used.

The settings listed below are the default values.

## Default Zone

The default zone used if an empty zone string is used. Everything that is not explicitly bound to another zone will be handled by the default zone.

    DefaultZone=public

## Minimal Mark

Marks up to this minimum are free for use for example in the direct interface. If more free marks are needed, increase the minimum.

    MinimalMark=100

## Clean Up On Exit

If set to no or false the firewall configuration will not get cleaned up on exit or stop of firewalld.

    CleanupOnExit=yes

## Lockdown

If set to enabled, firewall changes with the D-Bus interface will be limited to applications that are listed in the lockdown whitelist. The lockdown whitelist file is lockdown-whitelist.xml.

    Lockdown=no

## IPv6_rpfilter

Performs a reverse path filter test on a packet for IPv6. If a reply to the packet would be sent via the same interface that the packet arrived on, the packet will match and be accepted, otherwise dropped. The rp_filter for IPv4 is controlled using sysctl.

    IPv6_rpfilter=yes

## Individual Calls

Do not use combined -restore calls, but individual calls. This increases the time that is needed to apply changes and to start the daemon, but is good for debugging.

    IndividualCalls=no

## Log Denied

Add logging rules right before reject and drop rules in the INPUT, FORWARD and OUTPUT chains for the default rules and also final reject and drop rules in zones. Possible values are: `all`, `unicast`, `broadcast`, `multicast` and `off`.

    LogDenied=off

