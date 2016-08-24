---
layout: page
title: "Examples"
---

Here are some zone examples:

## external

    <?xml version="1.0" encoding="utf-8"?>
    <zone>
      <short>External</short>
      <description>For use on external networks. You do not trust the other computers on networks to not harm your computer. Only selected incoming connections are accepted.</description>
      <service name="ssh"/>
      <masquerade/>
    </zone>

## home

    <?xml version="1.0" encoding="utf-8"?>
    <zone>
      <short>Home</short>
      <description>For use in home areas. You mostly trust the other computers on networks to not harm your computer. Only selected incoming connections are accepted.</description>
      <service name="ssh"/>
      <service name="mdns"/>
      <service name="samba-client"/>
      <service name="dhcpv6-client"/>
    </zone>

## public

    <?xml version="1.0" encoding="utf-8"?>
    <zone>
      <short>Public</short>
      <description>For use in public areas. You do not trust the other computers on networks to not harm your computer. Only selected incoming connections are accepted.</description>
      <service name="ssh"/>
      <service name="dhcpv6-client"/>
    </zone>

## trusted

    <?xml version="1.0" encoding="utf-8"?>
    <zone target="ACCEPT">
      <short>Trusted</short>
      <description>All network connections are accepted.</description>
    </zone>

## drop

    <?xml version="1.0" encoding="utf-8"?>
    <zone target="DROP">
      <short>Drop</short>
      <description>Unsolicited incoming network packets are dropped. Incoming packets that are related to outgoing network connections are accepted. Outgoing network connections are allowed.</description>
    </zone>

## block

    <?xml version="1.0" encoding="utf-8"?>
    <zone target="%%REJECT%%">
      <short>Block</short>
      <description>Unsolicited incoming network packets are rejected. Incoming packets that are related to outgoing network connections are accepted. Outgoing network connections are allowed.</description>
    </zone>
