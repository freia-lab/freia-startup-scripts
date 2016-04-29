#!/bin/bash

echo "Stopping LDAP client daemon"
systemctl stop nslcd
nmcli device show >/tmp/network_devices
#nmcli connection add type ethernet con-name PLC1 ifname enp0s20u4 ip4 10.10.48.97/24
#nmcli connection up PLC1
touch /tmp/nuc-01b
