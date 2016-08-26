---
layout: page
title: "Direct Interface"
---

The direct interface is mainly used by services or applications to add specific firewall rules. It requires basic knowledge of ip(6)tables concepts (tables, chains, commands, parameters, targets).

It can also be used to add rules to the firewall, that are not supported by firewalld directly, yet. But it advised to use it carefully and only by advanced users.

Here is more information about the direct interface:

<ul>
{% for _node in site.data.nav %}{% assign level = 1 %}{% include toc.html level=level path="/" base_path=page.url node=_node %}{% endfor %}
</ul>

Further direct interface configuration options and generic information about the direct interface is also described in the [firewalld.direct](../man-pages/firewalld.direct.html) man page.
