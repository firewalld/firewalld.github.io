---
layout: page
title: "Service"
---

A firewalld service can be a list of local ports and destinations and additionally also a list of firewall helper modules automatically loaded if a service is enabled.
The use of predefined services makes it easier for the user to enable and disable access to a service.

Here is more information about services:

<ul>
{% for _node in site.data.nav %}{% assign level = 1 %}{% include toc.html level=level path="/" base_path=page.url node=_node %}{% endfor %}
</ul>

Further service configuration options and generic information about services are also described in the [firewalld.service](../man-pages/firewalld.service.html) man page.
