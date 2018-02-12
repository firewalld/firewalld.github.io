---
layout: page
title: "Options"
---



The configuration can contain these tags and attributes. Some of them are mandatory, others optional. 

## service

The mandatory service start and end tag defines the service. This tag can only be used once in a service configuration file. There are optional attributes for services: 

    version="string"

Give the service a version. 

## short

Is an optional start and end tag and is used to give a service a more readable name.

## description

Is an optional start and end tag to have a description for a service.

## port

Is an optional empty-element tag and can be used several times to have more than one port entry. All attributes of a port entry are mandatory: 

    port="string"

The port string can be a single port number or a port range portid-portid or also empty to match a protocol only. 

    protocol="string"

The protocol value can either be tcp or udp. 

For compatibility with older firewalld versions, it is possible to add protocols with the port option where the port is empty. With the addition of native protocol support in the service, this it not needed anymore. These entries will automatically be converted to protocols. With the next modification of the service file, the entries will be listed as protocols. 

## protocol

Is an optional empty-element tag and can be used several times to have more than one protocol entry. A protocol entry has exactly one attribute: 

    value="string"

The protocol can be any protocol supported by the system. Please have a look at /etc/protocols for supported protocols. 

## source-port

Is an optional empty-element tag and can be used several times to have more than one source port entry. All attributes of a source port entry are mandatory: 

    port="string"

The port string can be a single port number or a port range portid-portid. 

    protocol="string"

The protocol value can either be tcp or udp. 

## module

Is an optional empty-element tag and can be used several times to enable more than one netfilter kernel helper for the service. A module entry has exactly one attribute: 

    name="string"

Defines the name of the kernel netfilter helper as a string. 

## destination

Is an optional empty-element tag and can be used only once. The destination specifies the destination network as a network IP address (optional with /mask), or a plain IP address. The use of hostnames is not recommended, because these will only be resolved at service activation and transmitted to the kernel. For more information in this element, please have a look at --destination in iptables(8) and ip6tables(8). 

    ipv4="address[/mask]"

The IPv4 destination address with optional mask. 

    ipv6="address[/mask]"

The IPv6 destination address with optional mask. 
