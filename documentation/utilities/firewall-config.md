---
layout: page
title: "firewall-config"
---

This is the graphical configuration tool for firewalld.

![firewall-config](https://raw.githubusercontent.com/t-woerner/firewalld/master/doc/firewall-config.png "firewall-config")
*firewall-config*

On the left there is the overview of the active bindings. These are the zones, that have a connection, interface or source bound or added to it. Here it is possible to easily change the zone of these bindings. But it is not possible to add new bindings here. Use the `Interface` and `Source` tab in the `Zones` notebook on the right side for this.

The firewall-config tool has a drop-down selection menu labeled `Configuration`. This enables selecting between `Runtime` and `Permanent` mode. Notice that if you select `Permanent`, an additional row of icons will appear in the left hand corner. These icons only appear in permanent configuration mode because a service's parameters cannot be changed in runtime mode.

Changes in the permanent configuration mode are not effective immediately. If you want to have changes also in the runtime environment, then either add the changes there also or reload firewalld.

Further information about firewall-cmd please have a look at the [firewall-config](../man-pages/firewall-config.html) man page.
