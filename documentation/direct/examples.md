---
layout: page
title: "Examples"
---

Here are some examples:

## Blacklisting of the networks 192.168.1.0/24 and 192.168.5.0/24 with logging and dropping early in the raw table: 

    <?xml version="1.0" encoding="utf-8"?>
    <direct>
      <chain ipv="ipv4" table="raw" chain="blacklist"/>
      <rule ipv="ipv4" table="raw" chain="PREROUTING" priority="0">-s 192.168.1.0/24 -j blacklist</rule>
      <rule ipv="ipv4" table="raw" chain="PREROUTING" priority="1">-s 192.168.5.0/24 -j blacklist</rule>
      <rule ipv="ipv4" table="raw" chain="blacklist" priority="0">-m limit --limit 1/min -j LOG --log-prefix "blacklisted: "</rule>
      <rule ipv="ipv4" table="raw" chain="blacklist" priority="1">-j DROP</rule>
    </direct>