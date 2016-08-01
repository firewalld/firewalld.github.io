---
layout: page
title: "Configuration"
section: Documentation
--- 

firewalld supports two configuration directories:

## Default/Fallback configuration in `/usr/lib/firewalld`

This directory contains the default and fallback configuration provided by firewalld for icmptypes, services and zones. The files provided with the firewalld package should not get changed and the changes are gone with an update of the firewalld package. Additional icmptypes, services and zones can be provided with packages or by creating files.

## System configuration settings in `/etc/firewalld`

The system or user configuration stored here is either created by the system administrator or by customization with the configuration interface of firewalld or by hand. The files will overload the default configuration files.

To manually change settings of pre-defined icmptypes, zones or services, copy the file from the default configuration directory to the corresponding directory in the system configuration directory and change it accordingly.
