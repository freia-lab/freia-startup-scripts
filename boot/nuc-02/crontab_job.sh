#!/bin/bash
hostn=`hostname`
echo "Adding crontab job for monitoring /var partition usage"
cp /opt/startup/boot/$hostn/crontab.root /var/spool/cron/root
systemctl reload crond
