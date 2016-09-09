---
layout: page
title: "Configuration"
--- 

The configuration for firewalld is stored in various XML files in the [configuration directories](directories.html). This allows a great flexibility with fallbacks and system overrides.

## The Configuration Options

<ol>
{% for _node in site.data.nav %}{% assign level = 1 %}{% include toc.html level=level path="/" base_path=page.url node=_node %}{% endfor %}
</ol>
