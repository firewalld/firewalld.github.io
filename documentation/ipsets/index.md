---
layout: page
title: "IPSets"
---

An ipset can be used to group several IP or MAC addresses together. An ipset for IP addresses is either usable for IPv4 or IPv6. This is defined by the family setting of the ipset. It can be either inet (the default) or inet6.

With the use of ipsets, the number of rules for black or white listing for example is reduced to only a few rules for a long list of addresses in the ipset. The numbre of needed rules depends on the use case.

## Table of Contents

<ol>
{% for _node in site.data.nav %}{% assign level = 1 %}{% include toc.html level=level path="/" base_path=page.url node=_node %}{% endfor %}
</ol>

