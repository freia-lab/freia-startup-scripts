#!/bin/bash
device=enx0c0e768ff587
host=`hostname`
ip link  >/tmp/network_devices
hostname >/tmp/hostname
echo "Setting address for $device"
ip addr add 10.1.11.31/16 dev $device
#ip link set dev $device up
ip link set dev $device up
echo "Setting up symmetric routing"
ip route add 192.168.10.0/24 dev eno1 tab 1
ip route add 10.1.0.0/16 dev $device tab 2
# ip route add default via xxx dev $device tab 2
ip route add default via 192.168.10.1 dev eno1 tab 1
ip rule add from 192.168.10.129/32 tab 1 priority 100
ip rule add from 10.1.11.31/32 tab 2 priority 200
ip route flush cache

echo "Stopping LDAP client daemon"
systemctl stop nslcd
# nmcli device show >/tmp/network_devices
# echo "Adding LLAB connection"
# nmcli connection add type ethernet con-name LLAB ifname enp0s21f0u3 ip4 10.1.11.31/16 
# echo "Setting connection LLAB up"
# nmcli connection up LLAB

# echo "Setting up symmetric routing"
# ip route add 192.168.10.0/24 dev eno1 tab 1
# ip route add 10.1.0.0/16 dev enp0s21f0u3 tab 2
# ip route add default via 192.168.10.1 dev eno1 tab 1
# ip rule add from 192.168.10.128/32 tab 1 priority 100
# ip rule add from 10.1.11.31/32 tab 2 priority 200

# ip route flush cache

