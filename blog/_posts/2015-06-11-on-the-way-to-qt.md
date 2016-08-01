---
layout: post
title: "On the way to Qt"
section: Blog
date: 2015-06-11
author: Thomas Woerner
---

With the changes in newer Gtk versions, especially the deprecation of the StatusIcon for system tray icons, the firewalld GUI applications will be ported over to Qt.

The first application that has been ported over is firewall-applet. The applet is using Qt4 and tested on these desktop environments: KDE5, Xfce, LXDE and Gnome3 on Fedora 22.

This applet has been merged into the master tree and will be available in the next firewalld release 0.3.14.
