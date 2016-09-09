---
layout: page
title: "Directories"
---

firewalld supports two configuration directories:

## Default and Fallback Configuration

The directory `/usr/lib/firewalld` contains the default and fallback configuration provided by firewalld for icmptypes, services and zones. The files provided with the firewalld package should not get changed and the changes are gone with an update of the firewalld package. Additional icmptypes, services and zones can be provided with packages or by creating files.

## System Specific Configuration

The system or user configuration stored in `/etc/firewalld` is either created by the system administrator or by customization with the configuration interface of firewalld or by hand. The files will overload the default configuration files.

To manually change settings of pre-defined icmptypes, zones or services, copy the file from the default configuration directory to the corresponding directory in the system configuration directory and change it accordingly.

If there is no `/etc/firewalld` directory of if it there is no configuration in there, firewalld will start using the default configuration and default settings for `firewalld.conf`.
