---
layout: post
title: "MAC address support"
section: Blog
date: 2015-12-01T02:47:16
author: Thomas Woerner
redirect_from:
  - /2015/12/mac-address-support/
---

The MAC support branch has been merged into master and will be available with the nest version. This will be version 0.4.0 and is planned to be released in the next days.

You can use MAC addresses for zone bindings and also in rich rules. Here are two examples using the command line client:
<pre>firewall-cmd --zone=work --add-source=00:11:22:33:44:55
firewall-cmd --zone=work --add-rich-rule='rule source mac=11:22:33:44:55:66 drop'
</pre>

With this it is simply possible to add filters using MAC addresses.
firewall-config also is able to handle MAC addresses.
