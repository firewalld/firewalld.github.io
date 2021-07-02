---
layout: page
title: "firewall-offline-cmd"
---

This is the command line tool to be able to configure firewalld if it is not running or active, for example in the system installation stage or in a change root.

You need to be root to use firewall-offline-cmd.

firewall-offline-cmd is only able to provide information about the permanent convironment and also to alter it. It uses the firewalld core with the file IO handlers. firewall-offline-cmd can be used while firewalld is running, but it is not recommended. Changes made with firewall-offline-cmd are visible in firewall after about five seconds.

## Examples of the firewall-offline-cmd usage

### To get the firewalld version:

    # firewall-offline-cmd --version
    0.4.3.3

### To get the firewall-offline-cmd help output:

    # firewall-offline-cmd --help

### To get the zone of the interface `em1`

    # firewall-offline-cmd --get-zone-of-interface=em1
    no zone

## Further information

Please have a look at the [firewall-offline-cmd](../man-pages/firewall-offline-cmd.html) man page.
