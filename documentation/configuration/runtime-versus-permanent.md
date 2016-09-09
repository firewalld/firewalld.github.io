---
layout: page
title: "Runtime versus Permanent"
--- 

The configuration is separated into the runtime and the permanent configuration.

## Runtime configuration

Runtime configuration is the actual active configuration and is not permanent. After reload/restart of the service or a system reboot, runtime settings will be gone if they haven't been also in permanent configuration.

## Permanent configuration

The permanent configuration is stored in config files and will be loaded and become new runtime configuration with every machine boot or service reload/restart.
