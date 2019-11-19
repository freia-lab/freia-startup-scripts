#!/bin/bash
host=`hostname`
echo "Stopping LDAP client daemon"
systemctl stop nslcd
nmcli device show >/tmp/network_devices
hostname >/tmp/hostname
echo "Adding PLC1 connection"
nmcli connection add type ethernet con-name PLC1 ifname enp0s20u3 ip4 192.168.1.117/24
echo "Setting connection PLC1 up"
nmcli connection up PLC1

echo "Setting up symmetric routing"
ip route add 192.168.10.0/24 dev eno1 tab 1
ip route add 192.168.1.0/24 dev enp0s20u3 tab 2
ip route add default via 192.168.10.1 dev eno1 tab 1
ip rule add from 192.168.10.117/32 tab 1 priority 100
ip rule add from 192.168.1.117/32 tab 2 priority 200
ip route flush cache

#ip route add default via 192.168.10.1 dev eno1
