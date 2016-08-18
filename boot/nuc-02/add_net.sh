#!/bin/bash
host=`hostname`
echo "Stopping LDAP client daemon"
systemctl stop nslcd
nmcli device show >/tmp/network_devices
hostname >/tmp/hostname
#nmcli connection add type ethernet con-name PLC1 ifname enp0s20u4 ip4 10.10.48.97/24
echo "Adding CAGWPUB connection"
nmcli connection add type ethernet con-name CAGWPUB ifname enp0s20u3 ip4 130.238.200.140/25
echo "Setting up CAGWPUB connection"
nmcli connection up CAGWPUB
#ip route add default via 192.168.10.1 dev eno1
touch /tmp/nuc-02
echo "Setting up firewall rules"
iptables-restore </opt/startup/boot/$host/iptables.rules
