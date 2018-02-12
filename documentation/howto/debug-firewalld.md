---
layout: page
title: "Debug firewalld"
---

You can either add the --debug option to the firewalld arguments in the `/etc/sysconfig/firewalld` file or in the firewalld service file or you can start firewalld in a terminal after stopping the service.

### The sysconfig file

This file exists in Fedora and RHEL based distributions, but may not in others.

    # firewalld command line args
    # possible values: --debug
    FIREWALLD_ARGS=

To enable the debugging mode, add `--debug[=<level>]` to `FIREWALLD_ARGS`. For a list of the supported debug levels, please have a look further down.

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

To enable debugging, you can add the `--debug[=<level>]` option to `ExecStart`. For a list of the supported debug levels, please have a look further down.

### Start in terminal

As user root you can start the firewall daemon in a terminal for debugging:

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
