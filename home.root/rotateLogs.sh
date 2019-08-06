#!/bin/bash
h=`hostname`
cd /var/run/procServ
for f in *; do
    if [ -d ${f} ]; then
	logger -t rotateLogs "logrotate /opt/startup/ioc/$h/$f/logrotate.conf"
        pid=`systemctl show ioc@$f | awk -F = '/ExecMainPID/ {print $2}'`
        f=/opt/startup/ioc/$h/$f/logrotate.conf
	if [ -f "$f" ]; then
            /usr/sbin/logrotate $f
        fi
        if [ "$pid" != "0" ]; then
            logger -t rotateLogs "kill -SIGHUP $pid"
            kill -SIGHUP $pid
	fi  
    fi
done
