---
layout: page
title: "Examples"
---

Here are some example helpers:

## ftp

    <?xml version="1.0" encoding="utf-8"?>
    <helper module="nf_conntrack_ftp">
      <port protocol="tcp" port="21"/>
    </helper>

## pptp

    <?xml version="1.0" encoding="utf-8"?>
    <helper module="nf_conntrack_pptp" family="ipv4">
      <port protocol="tcp" port="1723"/>
    </helper>

## Q.931

    <?xml version="1.0" encoding="utf-8"?>
    <helper module="nf_conntrack_h323">
      <port protocol="tcp" port="1720"/>
    </helper>

## sip

    <?xml version="1.0" encoding="utf-8"?>
    <helper module="nf_conntrack_sip">
      <port protocol="tcp" port="5060"/>
      <port protocol="udp" port="5060"/>
    </helper>
