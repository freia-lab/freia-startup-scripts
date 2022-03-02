#!/bin/bash
echo Stopping LDAP client daemon
systemctl stop nslcd
export host=`hostname`
mkdir -p /var/log/procServ
echo starting the server
/usr/bin/screen -L -c /opt/startup/boot/$host/screen.cfg -d -m /usr/bin/bash /opt/startup/boot/nuc-05/vat616_server

