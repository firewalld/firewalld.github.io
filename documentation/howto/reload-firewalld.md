---
layout: page
title: "Reload firewalld"
---

## With firewall-cmd

To reload firewalld, you can use the command line client firewall-cmd:

    firewall-cmd --reload

Reload firewall rules and keep state information. Current permanent configuration will become new runtime configuration, i.e. all runtime only changes done until reload are lost with reload if they have not been also put into the permanent configuration.

    firewall-cmd --complete-reload

Reload firewall completely, even netfilter kernel modules. This will most likely terminate active connections, because state information is lost. This option should only be used in case of severe firewall problems. For example, if there are state information problems that no connection can be established with correct firewall rules.

## Using a signal

As root you can send the HUP signal to the firewall daemon to initiate reload:

    # killall -HUP firewalld
