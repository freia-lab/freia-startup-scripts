#!/bin/bash

export host=`hostname`
#host_ip=`host $host | awk '{print $4}'`
host_ip=`ip a show eno1 | awk '/metric/ {print $2}' |awk -F / '{print $1}'`

gwhome=/var/run/pvagw
uid=997
gid=995

export VIRTUAL_ENV=/usr/local/py-env/p4p
export PATH=/usr/local/py-env/p4p/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin

start()
{
	echo "Starting PVA gateway in $gwhome"
	[ ! -d $gwhome ] && mkdir $gwhome
	chown -R $uid:$gid $gwhome
	cd $gwhome
	python  -m p4p.gw /opt/startup/boot/$host/pvagw/pvagw.conf > pvagw.log 2>&1 &
}

stop()
{
        echo "Stopping PVA gateway in $gwhome"
        pid=`ps  -ef |grep p4p.gw |awk '!/grep/ {print $2}'`
	kill $pid
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

