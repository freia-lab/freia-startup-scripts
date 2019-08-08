#!/bin/bash
host=`hostname`
echo "Stopping LDAP client daemon"
systemctl stop nslcd
nmcli device show >/tmp/network_devices
hostname >/tmp/hostname
#echo "Adding ESYS connection"
#nmcli connection add type ethernet con-name ESYS ifname enp0s20u4 ip4 192.168.4.117/24
#echo "Setting connection ESYS up"
#nmcli connection up ESYS

#echo "Setting up symmetric routing"
#ip route add 192.168.10.0/24 dev eno1 tab 1
#ip route add 192.168.4.0/24 dev enp0s20u4 tab 2
#ip route add default via 192.168.10.1 dev eno1 tab 1
#ip rule add from 192.168.10.117/32 tab 1 priority 100
#ip rule add from 192.168.4.117/32 tab 2 priority 200
#ip route flush cache

#ip route add default via 192.168.10.1 dev eno1
