---
layout: page
title: "firewall-cmd"
---

firewall-cmd is the primary command line tool for firewalld. It can be used to
get state information about firewalld, to get the firewall configuration for the runtime and permanent environment and also to alter those.

Depending on the selected policy, you need to be authenticated to be able to access or alter the firewalld configuration. [polkit](http://www.freedesktop.org/wiki/Software/polkit) is used for this. It is only usable if firwalld is running.

This tool is used also by services to have a simple migration path from using iptables calls.

## Examples of the firewall-cmd usage

### To get the firewalld version:

    $ firewall-cmd --version
    0.4.3.3

### To get the firewall-cmd help output:

    $ firewall-cmd --help

### To get the firewalld state:

    $ firewall-cmd --state
    running

### To get the active zones with bindings:

    $ firewall-cmd --get-active-zones
    public
      interfaces: em1

### To get the zone of the interface `em1`

    $ firewall-cmd --get-zone-of-interface=em1
    public

## Further information

Please have a look at the [firewall-cmd](../man-pages/firewall-cmd.html) man page.
