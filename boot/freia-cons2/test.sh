#!/bin/bash

echo "Stopping LDAP client daemon"
systemctl stop nslcd
touch /tmp/niklas
