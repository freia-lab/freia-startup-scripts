#!/bin/bash

export host=`hostname`
host_ip=`host $host | awk '{print $4}'`

gwhome=/var/tmp/gateway
uid=997
gid=995

export PATH=/opt/epics/bases/base-3.14.12.5/bin/centos7-x86_64:/opt/epics/modules/environment/1.6.0/3.14.12.5/bin/centos7-x86_64:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin
export EPICS_HOST_ARCH=centos7-x86_64
export EPICS_MODULES_PATH=/opt/epics/modules
export EPICS_ENV_PATH=/opt/epics/modules/environment/1.6.0/3.14.12.5/bin/centos7-x86_64
export EPICS_BASES_PATH=/opt/epics/bases
 
start()
{
	echo "Starting CA gateway in $gwhome"
	[ ! -d $gwhome ] && mkdir $gwhome
	chown -R $uid:$gid $gwhome
	EPICS_CA_MAX_ARRAY_BYTES=1600000 gateway -home $gwhome -log gateway.log -prefix GW-$host -cip 192.168.10.255 -sip 130.238.200.140 -signore $host_ip -archive -no_cache -pvlist /opt/startup/boot/$host/gateway/GATEWAY.pvlist -access /opt/startup/boot/$host/gateway/GATEWAY.access -uid $uid -gid $gid -server
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

