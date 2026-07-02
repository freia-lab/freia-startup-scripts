#!/bin/bash
hostn=`hostname -s`
echo "Adding crontab job for monitoring /var partition usage and logrotate"
cp /opt/startup/boot/$hostn/crontab.root /var/spool/cron/root
systemctl reload crond
