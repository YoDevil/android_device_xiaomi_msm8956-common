#!/bin/bash

# Replace AID 2951 with 2901
sed -i -e 's|\xBC\x0B\x00\x00\xBB\x0B\x00\x00\x86\x0B\x00\x00\xE8\x03\x00\x00|\xBC\x0B\x00\x00\x55\x0B\x00\x00\x86\x0B\x00\x00\xE8\x03\x00\x00|' "${1}"
sed -i -e 's|/system/etc/data/netmgr_config.xml|/vendor/etc/data/netmgr_config.xml|' "${1}"

