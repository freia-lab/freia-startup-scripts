#!/bin/bash
h=`hostname`
cd /var/run/procServ
for f in *; do
    if [ -d ${f} ]; then
	logger -t rotateLogs "logrotate /opt/startup/ioc/$h/$f/logrotate.conf"
        pid=`systemctl status ioc@$f | awk '/Main PID:/ {print $3}'`
        f=/opt/startup/ioc/$h/$f/logrotate.conf
	if [ -f "$f" ]; then
            logrotate $f
        fi
        if [ ! -z "$pid" ]; then
            logger -t rotateLogs "kill -SIGHUP $pid"
            kill -SIGHUP $pid
	fi  
    fi
done
