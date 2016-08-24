---
layout: page
title: "Examples"
---

Here are some example services:

## ftp

    <?xml version="1.0" encoding="utf-8"?>
    <service>
      <short>FTP</short>
      <description>FTP is a protocol used for remote file transfer. If you plan to make your FTP server publicly available, enable this option. You need the vsftpd package installed for this option to be useful.</description>
      <port protocol="tcp" port="21"/>
      <module name="nf_conntrack_ftp"/>
    </service>


## ipset

    <?xml version="1.0" encoding="utf-8"?>
    <service>
      <short>IPsec</short>
      <description>Internet Protocol Security (IPsec) incorporates security for network transmissions directly into the Internet Protocol (IP). IPsec provides methods for both encrypting data and authentication for the host or network it sends to. If you plan to use a vpnc server or FreeS/WAN, do not disable this option.</description>
      <protocol value="ah"/>
      <protocol value="esp"/>
      <port protocol="udp" port="500"/>
      <port protocol="udp" port="4500"/>
    </service>

## mdns

    <?xml version="1.0" encoding="utf-8"?>
    <service>
      <short>Multicast DNS (mDNS)</short>
      <description>mDNS provides the ability to use DNS programming interfaces, packet formats and operating semantics in a small network without a conventional DNS server. If you plan to use Avahi, do not disable this option.</description>
      <port protocol="udp" port="5353"/>
      <destination ipv4="224.0.0.251" ipv6="ff02::fb"/>
    </service>
