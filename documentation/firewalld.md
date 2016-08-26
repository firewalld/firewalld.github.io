---
layout: page
title: "firewalld"
---

firewalld is the firewall daemon. It provides a dynamically managed firewall with support for network/firewall “zones” to assign a level of trust to a network and its associated connections, interfaces or sources. It has support for IPv4, IPv6, Ethernet bridges and also for IPSet firewall settings. There is a separation of the runtime and permanent configuration options. It also provides an interface for services or applications to add iptables, ip6tables and ebtables rules directly. This interface can also be used by advanced users.

## Reload firewalld

To reload firewalld you can either use the command line tool `firewall-cmd --reload` or `firewallctl reload` or you can send the `SIGHUP` signal to firewalld for example with `killall -HUP firewalld`.

## Debugging firewalld

You can either add the --debug option to the firewalld args in the `/etc/sysconfig/firewalld` file or in the firewalld service file or you can start firewalld in a terminal after stopping the service.

### The sysconfig file

This file does not exist in all distributions. In Fedora or RHEL based distributions it usable:

    # firewalld command line args
    # possible values: --debug
    FIREWALLD_ARGS=

To enable the debugging mode, add `--debug[=<level>]` to `FIREWALLD_ARGS`. For a list of the supported debug levels, please have a look furter down.

### The firewalld systemd service file

This is the firewalld systemd service file on Fedora for example:

    $ cat /usr/lib/systemd/system/firewalld.service
    [Unit]
    Description=firewalld - dynamic firewall daemon
    Before=network-pre.target
    Wants=network-pre.target
    After=dbus.service
    After=polkit.service
    Conflicts=iptables.service ip6tables.service ebtables.service ipset.service
    Documentation=man:firewalld(1)

    [Service]
    EnvironmentFile=-/etc/sysconfig/firewalld
    ExecStart=/usr/sbin/firewalld --nofork --nopid $FIREWALLD_ARGS
    ExecReload=/bin/kill -HUP $MAINPID
    # supress to log debug and error output also to /var/log/messages
    StandardOutput=null
    StandardError=null
    Type=dbus
    BusName=org.fedoraproject.FirewallD1
    KillMode=mixed

    [Install]
    WantedBy=multi-user.target
    Alias=dbus-org.fedoraproject.FirewallD1.service

To enable debugging, you can add the `--debug[=<level>]` option to `ExecStart`. For a list of the supported debug levels, please have a look furter down.

### Start in terminal

As user root you can start the firewall daemon in a termal for debugging:

    # firewalld --nofork --debug

With the `--nofork` option the daemon is not doing a fork and stays in the foreground. It is possible to use another debug level with `--debug[=<level>]`.

## The debug levels

Different debug levels are supported here. The default is debug level 1 if --debug is added to the command line. Higher debug levels can be specified with --debug=<level>. The higher the debug level the more output. The highest debug level is 10.

| Debug level | Output      |
| ----------- | ----------- |
|           1 | Loading config files, D-Bus method calls |
|           2 | + Backend calls, D-Bus Introspect method calls, access checks |
|           3 | + Rules that are added by the backends |
|           4 | + Transaction steps |
|       5 - 9 | Currently unused
|          10 | + Introspection XML data |

## Further information

Please have a look at the [firewalld](man-pages/firewalld.html) man page.
