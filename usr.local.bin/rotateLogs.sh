#!/bin/bash
h=`hostname`
if [ -d /var/run/procServ ]; then
	cd /var/run/procServ
	for ioc in *; do
    		if [ -d ${ioc} ]; then
        		f=/opt/startup/e3ioc/$h/$ioc/logrotate.conf
			if [ -f "$f" ]; then
            			pid=`systemctl show e3ioc@$ioc | awk -F = '/ExecMainPID/ {print $2}'`
	    			logger -t rotateLogs "logrotate $f"
            			/usr/sbin/logrotate --state /var/run/logrotate-status $f
            			if [ "$pid" != "0" ]; then
                			logger -t rotateLogs "kill -SIGHUP $pid"
                			kill -SIGHUP $pid
	    			fi  
        		fi
    		fi
	done
fi

