---
layout: post
title: "firewalld 0.3.14 release"
section: Blog
date: 2015-06-12T21:52:00
author: Thomas Woerner
category: release
---

The new firewalld version 0.3.14 is available with several enhancements and bug fixes.

The main changes are

**Enabled the use of firewalld without firewalld.conf**

Firewalld can now be used without a firewalld.conf file in /etc/firewalld. The fall back settings are used in this case.

**ebtables support**

ebtables is now supported and can be used in direct chains and rules.

**Rich Language**

Masquerading with a destination address is now possible. Forwarding rules are now limited to new connections.

**Reload with direct rules**

The issue while reloading with permanent direct rules has been fixed.

**firewall-applet**

The applet has been ported over to Qt4 as the StatusIcon support in Gtk3 has been deprecated. The port to a Gnome only applet is not possible as it would only be usable in Gnome3. The gtk upstream proposed solution to port back to gtk2 is also not possible, as gtk2 is a dead end and will not be usable together with dbus and polkit in Python.

The Qt4 applet did not need work a rounds or tweaks as the former Gtk3 version to make it work in different desktop environments like Gnome, KDE4, KDE5, Mate, Xfce and others.

**Python 3 support**

Additional bindings sub package for Python3. There are now python-firewall and python3-firewall.

**Migration to github**

The source repository is now hosted at github.

There are also some optimizations and build environment fixes.

***

The new firewalld version 0.3.14 is available here:

 * Tarball: [firewalld-0.3.14.tar.bz2](https://fedorahosted.org/released/firewalld/firewalld-0.3.14.tar.bz2)
 * SHA1: 88116d11277a435479391b1074dfa7e7a8bedc8f
 * Source repository on github: [v0.3.14](https://github.com/t-woerner/firewalld/releases/tag/v0.3.14)
 * Complete changelog on github: [0.3.13 to 0.3.14](https://github.com/t-woerner/firewalld/compare/v0.3.13...v0.3.14)
