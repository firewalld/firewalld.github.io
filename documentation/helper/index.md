---
layout: page
title: "Helper"
---

A firewalld helper defines the configuration that are needed to be able to use a netfilter connection tracking helper if automatic helper assignment is turned off, which is then the secure use of connection tracking helpers.

This can be achieved wither with the kernel default setting for nf_conntrack_helper, a sysctl setting of net/netfilter/nf_conntrack_helper or with the AutomaticHelpers setting in the firewalld.conf file.

A firewalld helper can be a list of local ports, a kernel module and a fmaily definition.

Here is more information about helpers:

<ul>
{% for _node in site.data.nav %}{% assign level = 1 %}{% include toc.html level=level path="/" base_path=page.url node=_node %}{% endfor %}
</ul>

Further helper configuration options and generic information about helpers are also described in the [firewalld.helper](../man-pages/firewalld.helper.html) man page.
