---
layout: page
title: "Zone"
---

A network or firewall zone defines the trust level of the interface used for a connection. There are several pre-defined zones provided by firewalld. Zone configuration options and generic information about zones are described in [firewalld.zone](https://twoerner.fedorapeople.org/firewalld/doc/firewalld.zone.html)

## Table of Contents

<ol>
{% for _node in site.data.nav %}{% assign level = 1 %}{% include toc.html level=level path="/" base_path=page.url node=_node %}{% endfor %}
</ol>
