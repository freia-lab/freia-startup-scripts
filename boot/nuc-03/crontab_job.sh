#!/bin/bash
hostn=`hostname -s`
echo "Adding crontab job for monitoring /var partition usage and logrotate"
cp /opt/startup/boot/$hostn/crontab.root /var/spool/cron/crontabs/root
chmod 0600 /var/spool/cron/crontabs/root
systemctl restart cron
