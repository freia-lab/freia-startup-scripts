#!/bin/bash

device1=enx000ec6f92147
device2=enx000ec6fa0b01
nmcli device show >/tmp/network_devices
#nmcli connection add type ethernet con-name PLC1 ifname $device1 ip4 192.168.1.115/24
#nmcli connection add type ethernet con-name ESYS ifname $device2 ip4 192.168.4.115/24

#nmcli connection up PLC1
ip addr add 192.168.1.115/24 dev $device1
ip link set dev $device1 up

#nmcli connection up ESYS
ip addr add 192.168.4.115/24 dev $device2
ip link set dev $device2 up

echo "Setting up symmetric routing"
ip route add 192.168.10.0/24 dev eno1 tab 1
ip route add 192.168.1.0/24 dev $device1 tab 2
ip route add default via 192.168.1.1 dev $device1 tab 2
ip route add default via 192.168.10.1 dev eno1 tab 1
ip rule add from 192.168.10.115/32 tab 1 priority 100
ip rule add from 192.168.1.115/24 tab 2 priority 200
ip route flush cache

