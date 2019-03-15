---
layout: page
title: "Get firewalld State"
---

## With firewall-cmd

To get the firewalld state with firewall-cmd, use the following command:

    $ firewall-cmd --state
    running

It returns an exit code 0 if it is active, NOT_RUNNING otherwise (see the firewalld “Exit Codes”). The command will also print the state to STDOUT.

## With systemctl

    $ systemctl status firewalld
    ● firewalld.service - firewalld - dynamic firewall daemon
       Loaded: loaded (/usr/lib/systemd/system/firewalld.service; enabled; vendor pr
       Active: active (running) since Wed 2016-06-29 14:28:51 CEST; 1 weeks 6 days a
         Docs: man:firewalld(1)
     Main PID: 24540 (firewalld)
        Tasks: 2 (limit: 512)
       CGroup: /system.slice/firewalld.service
               └─24540 /usr/bin/python3 -Es /usr/sbin/firewalld --nofork --nopid

