---
layout: page
title: "Enable and Disable firewalld"
---

firewalld provides an init script for systems using classic SysVinit and also a systemd service file. The following documentation is about the systemd service used in Fedora, RHEL and CentOS distributions.

It is not recommended to use iptables directly while firewalld is running as this could lead into some unexpected issues. If a user for example is removing base rules or chains of the chain structure, than a firewalld reload might be needed to create them again.

## Install and enable firewalld

If the iptables, ip6tables, ebtables and ipset services are in use:

    systemctl disable --now iptables.service
    systemctl disable --now ip6tables.service
    systemctl disable --now etables.service
    systemctl disable --now ipset.service
    dnf install firewalld firewall-config firewall-applet
    systemctl unmask --now firewalld.service
    systemctl enable --now firewalld.service

To check the firewall state you have different options. The fist option is to use `systemctl status firewalld` the other one is to use `firewall-cmd --state`.

The output of the systemctl command should look like this:

    $ systemctl status firewalld
    ● firewalld.service - firewalld - dynamic firewall daemon
       Loaded: loaded (/usr/lib/systemd/system/firewalld.service; enabled; vendor pr
       Active: active (running) since Wed 2016-06-29 14:28:51 CEST; 1 weeks 6 days a
         Docs: man:firewalld(1)
     Main PID: 24540 (firewalld)
        Tasks: 2 (limit: 512)
       CGroup: /system.slice/firewalld.service
               └─24540 /usr/bin/python3 -Es /usr/sbin/firewalld --nofork --nopid

The output of the firewall-cmd command should look like this:

    $ firewall-cmd --state
    running

## Install and enable iptables, ip6tables, ebtables and ipset services

If firewalld is enabled and you want to enable the iptables, ip6tables, ebtables and ipset services instead:

    dnf install iptables-services ebtables ipset-service
    systemctl mask --now firewalld.service
    systemctl enable --now iptables.service
    systemctl enable --now ip6tables.service
    systemctl enable --now etables.service
    systemctl enable --now ipset.service

The use of the mask line is recommended as systemd will start firewalld if there is another service requires it or if the D-Bus interface of firewalld is used. If the service only gets disabled, then it will not be auto started anymore.
