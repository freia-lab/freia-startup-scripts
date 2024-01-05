#!/bin/bash
device=enx00249b6dcb8b
host=`hostname`
ip link  >/tmp/network_devices
hostname >/tmp/hostname
#ip link add $device type ethernet
#Set address for dev $device
echo "Setting address for $device"
ip addr add 130.238.200.145/25 dev $device
#ip link set dev $device up
ip link set dev $device up
echo "Setting up symmetric routing"
ip route add 192.168.10.0/24 dev eno1 tab 1
ip route add 130.238.200.128/25 dev $device tab 2
ip route add default via 130.238.200.129 dev $device tab 2
ip route add default via 192.168.10.1 dev eno1 tab 1
ip rule add from 192.168.10.129/32 tab 1 priority 100
ip rule add from 130.238.200.145/32 tab 2 priority 200
ip route flush cache

touch /tmp/nuc-09
echo "Setting up firewall rules"
iptables-restore </opt/startup/boot/$host/iptables.rules
