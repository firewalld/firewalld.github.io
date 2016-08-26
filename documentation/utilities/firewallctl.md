---
layout: page
title: "firewallctl"
---

firewallctl is a new command line tool for firewalld that has been added to have simpler and shorter options. It can be used to get state information about firewalld, to get the firewall configuration for the runtime and permanent environment and also to alter those.

Depending on the selected policy, you need to be authenticated to be able to access or alter the firewalld configuration. [polkit](http://www.freedesktop.org/wiki/Software/polkit) is used for this.

firewallctl has been added with version 0.4.3.

## Examples of the firewall-cmd usage

### To get the firewalld version:

    $ firewallctl version
    0.4.3.3

### To get the firewallctl help output:

    $ firewallctl --help

### To get the firewalld state:

    $ firewallctl state
    running

### To get the active zones:

    $ firewallctl list zones --active
    public

### To get the firewalld configuration:

    $ firewallctl config list
    default-zone public
    lockdown     no
    log-denied   off
    panic        no

### To get firewalld runtime settings:

    $ firewallctl settings list
    BRIDGE          yes
    CleanupOnExit   yes
    IPSet           yes
    IPSetTypes      hash:mac hash:net hash:ip
    IPv4            yes
    IPv6            yes
    IPv6_rpfilter   yes
    IndividualCalls no
    MinimalMark     100

## Further information

Please have a look at the [firewallctl](../man-pages/firewallctl.html) man page.
