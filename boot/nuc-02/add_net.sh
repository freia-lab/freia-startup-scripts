#!/bin/bash
device1=enx00249b13a113
host=`hostname`
echo "Stopping LDAP client daemon"
systemctl stop nslcd
nmcli device show >/tmp/network_devices
hostname >/tmp/hostname
echo "Adding CAGWPUB connection"
echo "Setting address for $device1"
ip addr add 192.168.1.140/25 dev $device1
ip link set dev $device1 up
#nmcli connection add type ethernet con-name CAGWPUB ifname enp0s20u3 ip4 130.238.200.140/25 gw4 130.238.200.129
#echo "Setting up CAGWPUB connection"
#nmcli connection up CAGWPUB
echo "Setting up symmetric routing"
ip route add 192.168.10.0/24 dev eno1 tab 1
ip route add 130.238.200.128/25 dev $device1 tab 2
ip route add default via 130.238.200.129 dev $device1 tab 2
ip route add default via 192.168.10.1 dev eno1 tab 1
ip rule add from 192.168.10.116/32 tab 1 priority 100
ip rule add from 130.238.200.140/32 tab 2 priority 200
ip route flush cache

touch /tmp/nuc-02
echo "Setting up firewall rules"
iptables-restore </opt/startup/boot/$host/iptables.rules
