---
layout: page
title: "Zone"
---

A firewall zone defines the trust level for a connection, interface or source address binding. This is a one to many relation, which means that a connection, interface or source can only be part of one zone, but a zone can be used for many network connections, interfaces and sources.

Here is more information about zones:

<ul>
{% for _node in site.data.nav %}{% assign level = 1 %}{% include toc.html level=level path="/" base_path=page.url node=_node %}{% endfor %}
</ul>

Zone configuration options and generic information about zones are also described in the [firewalld.zone]({{site.baseurl}}/documentation/man-pages/firewalld.zone.html) man page.