---
layout: page
title: "Services"
---

A firewalld service can be a list of local ports and destinations and additionally also a list of firewall helper modules automatically loaded if a service is enabled. Service configuration options and generic information about services are described in [firewalld.service](https://twoerner.fedorapeople.org/firewalld/doc/firewalld.service.html). The use of predefined services makes it easier for the user to enable and disable access to a service.

## Table of Contents

<ol>
{% for _node in site.data.nav %}{% assign level = 1 %}{% include toc.html level=level path="/" base_path=page.url node=_node %}{% endfor %}
</ol>

