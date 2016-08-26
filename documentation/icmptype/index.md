---
layout: page
title: "ICMP Type"
---

The Internet Control Message Protocol (ICMP) is used to exchange information and also error messages in the Internet Protocol (IP). ICMP types can be used in firewalld to limit the exchange of these messages.

Here is more information about ICMP types:

<ul>
{% for _node in site.data.nav %}{% assign level = 1 %}{% include toc.html level=level path="/" base_path=page.url node=_node %}{% endfor %}
</ul>

Further ICMP type configuration options and generic information about ICMP types are also described in the [firewalld.icmptype](../man-pages/firewalld.icmptype.html) man page.
