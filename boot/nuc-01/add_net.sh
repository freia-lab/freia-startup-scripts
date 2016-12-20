#!/bin/bash

echo "Stopping LDAP client daemon"
systemctl stop nslcd
nmcli device show >/tmp/network_devices
#nmcli connection add type ethernet con-name PLC1 ifname enp0s20u4 ip4 10.10.48.97/24
nmcli connection add type ethernet con-name PLC1 ifname enp0s20u4 ip4 192.168.1.115/24
nmcli connection add type ethernet con-name ESYS ifname enp0s20u3 ip4 192.168.4.115/24
nmcli connection up PLC1
nmcli connection up ESYS
ip route add default via 192.168.10.1 dev eno1
#touch /tmp/konrad
