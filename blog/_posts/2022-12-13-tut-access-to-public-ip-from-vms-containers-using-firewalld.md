---
layout: post
title: "Access to public IP from VMs/Containers using Firewalld"
section: Blog
date: 2022-12-13T13:00:00
author: David Foley
category: tutorial
---

You are running some LXC containers on a host and you use Firewalld to forward ports from the public internet to the containers. How do you enable access to the public IP of the LXD host from the LXC containers?

## TL;DR
- Ordinairly connections from containers to to services which are reached by port forwarding on Firewalld fail, because after outputting the packet to the public interface, it never returns and therefore Firewalld cannot process the port forward.
- The soloution is destination NAT: `sudo firewall-cmd --zone=trusted --add-rich-rule='rule family="ipv4" destination address="203.0.113.1" forward-port port="80" protocol="tcp" to-port="80" to-addr="10.10.1.20"'`

## The Scenario
You have some LXC containers running on a host, the default LXD setup creates a virtual bridge to which all the containers are connected, they have their own private network say in the 10.10.1.0/24 subnet.

You use Firewalld to forward ports from the public internet to the containers. In this scenario when a container does a DNS lookup to which the answer is the public IP address of the LXD host and the container then tries to connect to say port 80 on that public IP it will fail.

Why? The HTTP request is received on the input chain by firewalld, the packet is then output to the public interface of the host. Since the HTTP Proxy is not bound to the public interface the connection fails. It instead must be reached via port forwards in Firewalld. After outputting the packet to the public interface, it never returns and therefore Firewalld cannot process the port forward.

## The Solution
Destination NAT rules in firewalld are the solution here.

I understand NAT would appear to be an obvious answer. Indeed if you simply enable masquerading on the zone which contains the container virtual network this will begin to work, this has the unintended consequence of also source NATing all incoming requests to the containers. This means client IPs will no longer visible to applications running in containers.

Destination NAT is applied on the prerouting chain, before the routing decision, where it modifies the destination IP address of the packet based. In the example the diagram describes Firewalld recognises that the destination IP for the HTTP request is the public IP of the host. After this it takes the packet and changes the destination IP address to the internal IP address of the Web Proxy Container.

To setup DST-NAT on the example host, you would follow this procedure:

1. Execute these commands on the Firewalld host:
```
sudo firewall-cmd --zone=trusted --add-rich-rule='rule family="ipv4" destination address="203.0.113.1" forward-port port="80" protocol="tcp" to-port="80" to-addr="10.10.1.20"'
sudo firewall-cmd --zone=trusted --add-rich-rule='rule family="ipv4" destination address="203.0.113.1" forward-port port="443" protocol="tcp" to-port="443" to-addr="10.10.1.20"'
```
__Explanation:__
- These two rules apply DST-NAT to packets destined for 203.0.113.1, port 80 and port 443.
- You will need to make sure `--zone=` matches the zone you have your container virtual network bound to.
- In this example 203.0.113.1 is our public IP address, change this to match yours
- In this example 10.10.1.20 is the internal IP address of the container running HTTP reverse proxy. Change this IP to match your setup.
- If you add other protocols which where handled by port forwarding, you would just continue adding rules with the appropriate port numbers.

2. Verify the setup works. If it does, make the changes permanent by executing the following:
```
sudo firewall-cmd --permanent --zone=trusted --add-rich-rule='rule family="ipv4" destination address="203.0.113.1" forward-port port="80" protocol="tcp" to-port="80" to-addr="10.10.1.20"'
sudo firewall-cmd --permanent --zone=trusted --add-rich-rule='rule family="ipv4" destination address="203.0.113.1" forward-port port="443" protocol="tcp" to-port="443" to-addr="10.10.1.20"'
```
__Explanation:__
- These two commands are the same as those from the first step with the simple addition of the `--permanent` flag to make them permanent

-----

 * Originally posted at [David Foley's Blog](https://www.dfoley.ie/blog/access-to-public-ip-from-vms-containers-using-firewalld), complete with diagrams.
