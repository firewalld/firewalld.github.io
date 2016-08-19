---
layout: page
title: "Use of Zones"
---

## Which zone should be used?

A public WIFI network connection for example should be mainly untrusted, a wired home network connection should be fairly trusted. Select the zone that best matches the network you are using.

## How to configure or add zones?

To configure or add zones you can either use one of the firewalld interfaces to handle and change the configuration. These are the graphical configuration tool firewall-config, the command line tool firewall-cmd or the D-BUS interface. Or you can create or copy a zone file in one of the configuration directories. @PREFIX@/lib/firewalld/zones is used for default and fallback configurations and /etc/firewalld/zones is used for user created and customized configuration files.
