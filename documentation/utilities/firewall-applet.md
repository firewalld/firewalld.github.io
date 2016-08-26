---
layout: page
title: "firewall-applet"
---

firewall-applet is a tray applet for firewalld. It provides information about the firewalld configuration like the default zone and also the zone bindings like connections, interfaces and sources.

There is a left and also right mouse button menu and also a tooltip with the active settings when moving the mouse over the icon.

The applet has ben ported over to Qt4 as the StatusIcon support in Gtk3 has been deprecated.

## Limitations with Gnome3

Not all options are available in Gnome3. This desktop environment changes the behaviour of the applet externally:

* With enabled notifications, the icon is made unvisible after it was sending out a notification. The applet is not able to detect or change that it is hidden.
* The tooltip is not visible.
* The menus are not always usable or visible.
