#!/bin/bash

export host=`hostname`
#host_ip=`host $host | awk '{print $4}'`
host_ip=`ip a show eno1 | awk '/metric/ {print $2}' |awk -F / '{print $1}'`

gwhome=/var/run/gateway
uid=997
gid=995

export PATH=/epics/base-7.0.7/require/5.0.0/bin:/epics/base-7.0.7/bin/linux-x86_64:/usr/sbin:/usr/bin:/sbin:/bin
export EPICS_HOST_ARCH=linux-x86_64
export EPICS_BASE=/epics/base-7.0.7
export LD_LIBRARY_PATH=/epics/base-7.0.7/lib/linux-x86_64
 
start()
{
	echo "Starting CA gateway in $gwhome"
	[ ! -d $gwhome ] && mkdir $gwhome
	chown -R $uid:$gid $gwhome
	EPICS_CA_MAX_ARRAY_BYTES=20000000 gateway -home $gwhome -log gateway.log -prefix GW-$host -cip 192.168.10.255 -sip 130.238.200.140 -signore $host_ip -archive -no_cache -pvlist /opt/startup/boot/$host/gateway/GATEWAY.pvlist -access /opt/startup/boot/$host/gateway/GATEWAY.access -uid $uid -gid $gid -server
}

stop()
{
        echo "Stopping CA gateway in $gwhome"
        [ -f $gwhome/gateway.killer ] && $gwhome/gateway.killer
}


case "$1" in
'start')
  start
  ;;

'stop')
  stop
  ;;

*)
  echo "Usage: $0 {start|stop}"
  exit 1
  ;;
esac

