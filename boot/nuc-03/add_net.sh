#!/bin/bash
device1=enx0c0e768ff587
device2=enx1c0e768ff587
host=`hostname`
echo "Stopping LDAP client daemon"
systemctl stop nslcd
nmcli device show >/tmp/network_devices
hostname >/tmp/hostname
echo "Adding PLC1 connection"
echo "Setting address for $device1"
###ip addr add 192.168.1.117/24 dev $device1
#ip link set dev $device1 up
###ip link set dev $device1 up
# nmcli connection add type ethernet con-name PLC1 ifname enp0s20u3 ip4 192.168.1.117/24
echo "Adding NESSA connection"
echo "Setting address for $device2"
###ip addr add 192.168.21.117/24 dev $device2
###ip link set dev $device1 up
# nmcli connection add type ethernet con-name NESSA ifname enp0s20u4 ip4 192.168.21.117/24
# echo "Setting connection PLC1 up"
# nmcli connection up PLC1
# echo "Setting connection NESSA up"
# nmcli connection up NESSA

echo "Setting up symmetric routing"
###ip route add 192.168.10.0/24 dev eno1 tab 1
###ip route add 192.168.1.0/24 dev $device1 tab 2
###ip route add default via 192.168.10.1 dev eno1 tab 1
###ip rule add from 192.168.10.117/32 tab 1 priority 100
###ip rule add from 192.168.1.117/32 tab 2 priority 200

# nmcli connection modify NESSA +ipv4.routes "192.168.20.0/24 192.168.21.1"
###ip route add 192.168.20.0/24 via 192.168.21.1 dev $device2

###ip route flush cache

#ip route add default via 192.168.10.1 dev eno1
