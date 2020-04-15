---
layout: post
title: "ipset support"
section: Blog
date: 2015-12-01T02:47:16
author: Thomas Woerner
---

The support for ipsets has been added to the git repo of firewalld and will be available with the next version. This will be version 0.4.0 and is planned to be released in the next days.

With ipsets it is simple to create black or white lists for ip, network or mac address. An ipset can simply be used to bind zones to or also in rich rules. Witht he use in rich rules also more complex rules can be created.

The advantage of using ipsets is that it is not needed to add a rule per IP address that needs to be black listed in the example. There is only one rule added to the firewall to use the ipset for black listing. The matching against the set entries is a lot faster.

Here is an example for a blcklist creation using an ipset for IPv4:

To create the ipset blacklist for IPv4:
<pre>
firewall-cmd --permanent --new-ipset=blacklist --type=hash:ip
</pre>

Reload to make the ipset usable in runtime environment:
<pre>
firewall-cmd --reload
</pre>

Add runtime only entries to the blacklist:
<pre>
firewall-cmd --ipset=blacklist --add-entry=192.168.1.4
firewall-cmd --ipset=blacklist --add-entry=192.168.1.6
firewall-cmd --ipset=blacklist --add-entry=192.168.1.8
firewall-cmd --ipset=blacklist --add-entry=192.168.1.10
</pre>

Add a rich rule in the default zone for dropping all entries on the blacklist:
<pre>
firewall-cmd --add-rich-rule='rule source ipset=blacklist drop'
</pre>

To create the ipset blacklist6 for IPv6:
<pre>
firewall-cmd --permanent --new-ipset=blacklist6 --type=hash:ip --option=family=inet6
</pre>
The option family needs to be set to inet6 to make sure that the ipset is using IPv6 addresses.

Reload to make the ipset usable in runtime environment:
<pre>
firewall-cmd --reload
</pre>

Add runtime only entries to the blacklist6:
<pre>
firewall-cmd --ipset=blacklist6 --add-entry=fe80::07FF:0004
firewall-cmd --ipset=blacklist6 --add-entry=fe80::07FF:0006
firewall-cmd --ipset=blacklist6 --add-entry=fe80::07FF:0008
firewall-cmd --ipset=blacklist6 --add-entry=fe80::07FF:0010
</pre>

Add a rich rule in the default zone for dropping all entries on the blacklist6:
<pre>
firewall-cmd --add-rich-rule='rule source ipset=blacklist6 drop'
</pre>

firewall-config also is able to handle MAC addresses.

There is one limitation with ipset usage in firewalld though:

If the timeout option is used for an ipset, then it will not be possible to list the entries of the ipset with firewalld as the timeout is directly done in kernel space and adding additional timers for each entry could result in a high load of firewalld.

