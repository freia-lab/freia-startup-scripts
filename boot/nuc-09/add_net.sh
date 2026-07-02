#!/bin/bash
host=`hostname -s`
ip link  >/tmp/network_devices
hostname >/tmp/hostname
touch /tmp/nuc-09
