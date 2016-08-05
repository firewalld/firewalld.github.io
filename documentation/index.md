---
layout: page
title: Documentation
---

firewalld provides a dynamically managed firewall with support for network/firewall zones to define the trust level of network connections or interfaces. It has support for IPv4, IPv6 and bridge firewall settings, also for IPSets. There is a separation of the runtime and permanent configuration. It also provides an interface to add iptables, ip6tables and ebtables rules directly for example for services, applications but also advanced users.

## Table of Contents

<ol>
{% for _node in site.data.nav %}{% assign level = 1 %}{% include toc.html level=level path="/" base_path=page.url node=_node %}{% endfor %}
</ol>
