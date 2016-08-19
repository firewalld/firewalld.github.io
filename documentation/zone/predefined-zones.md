---
layout: page
title: "Predefined Zones"
---

These are the zones provided by firewalld sorted according to the default trust level of the zones from untrusted to trusted:

### drop

Any incoming network packets are dropped, there is no reply. Only outgoing network connections are possible.

### block

Any incoming network connections are rejected with an icmp-host-prohibited message for IPv4 and icmp6-adm-prohibited for IPv6. Only network connections initiated within this system are possible.

### public

For use in public areas. You do not trust the other computers on networks to not harm your computer. Only selected incoming connections are accepted.

### external

For use on external networks with masquerading enabled especially for routers. You do not trust the other computers on networks to not harm your computer. Only selected incoming connections are accepted.

### dmz

For computers in your demilitarized zone that are publicly-accessible with limited access to your internal network. Only selected incoming connections are accepted.

### work

For use in work areas. You mostly trust the other computers on networks to not harm your computer. Only selected incoming connections are accepted.

### home

For use in home areas. You mostly trust the other computers on networks to not harm your computer. Only selected incoming connections are accepted.

### internal

For use on internal networks. You mostly trust the other computers on the networks to not harm your computer. Only selected incoming connections are accepted.

### trusted

All network connections are accepted.
