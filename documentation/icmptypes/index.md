---
layout: page
title: "ICMP Types"
---

The Internet Control Message Protocol (ICMP) is used to exchange information and also error messages in the Internet Protocol (IP). ICMP types can be used in firewalld to limit the exchange of these messages. For more information, please have a look at [firewalld.icmptype](https://twoerner.fedorapeople.org/firewalld/doc/firewalld.icmptype.html).

## Table of Contents

<ol>
{% for _node in site.data.nav %}{% assign level = 1 %}{% include toc.html level=level path="/" base_path=page.url node=_node %}{% endfor %}
</ol>

