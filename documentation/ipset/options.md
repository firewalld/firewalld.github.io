---
layout: page
title: "Options"
---

The config can contain these tags and attributes. Some of them are mandatory, others optional. 

## ipset

The mandatory ipset start and end tag defines the ipset. This tag can only be used once in a ipset configuration file. There is one mandatory and also optional attributes for ipsets: 

    type="string"

The mandatory type of the ipset. This cas be one of these types: hash:ip, hash:net, hash:mac. 

    version="string"

To give the ipset a version. 

## short

Is an optional start and end tag and is used to give an icmptype a more readable name. 

## description

Is an optional start and end tag to have a description for a icmptype. 

## option

Is an optional empty-element tag and can be used several times to have more than one option. Mostly all attributes of an option entry are mandatory: 

    name="string"

The mandatory option name string. 

    value="string"

The optional value of the option. 

The supported options are: `family: "inet"|"inet6"`, `timeout: integer`, `hashsize: integer`, `maxelem: integer`. For more information on these options, please have a look at the ipset documentation. 

## entry

Is an optional start and end tag and can be used several times to have more than one entry entry. An entry entry does not have attributes. 