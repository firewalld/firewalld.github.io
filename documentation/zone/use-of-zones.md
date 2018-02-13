---
layout: page
title: "Use of Zones"
---

## Which zone should be used?

A public WIFI network connection for example should be mainly untrusted, a wired home network connection should be fairly trusted. Select the zone that best matches the network you are using.

## How to configure or add zones?

To configure or add zones, you can use any of the following firewalld
configuration interfaces:

	* Graphical configuration tool `firewall-config`
	* Command line tool `firewall-cmd`
	* Programmatic D-BUS interface. See man page `FIREWALLD.DBUS(5)`.
	* Edit configuration files. See man page `FIREWALLD.ZONE(5)`.
		* create, copy, or edit a zone file in one of the configuration directories
			* `/etc/firewalld/zones` for user created and customized configuration files.
			* `/usr/lib/firewalld/zones` for default and fallback configurations only.
