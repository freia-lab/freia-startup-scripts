#!/bin/bash
EPICS_BASE=/opt/epics/bases/base-3.15.4
EPICS_HOST_ARCH=centos7-x86_64
EPICS_DB_INCLUDE_PATH=/opt/epics/bases/base-3.15.4/dbd
EPICS_MODULES_PATH=/opt/epics/modules
EPICS_ENV_PATH=/opt/epics/modules/environment/2.1.1/3.15.4/bin/centos7-x86_64
EPICS_BASES_PATH=/opt/epics/bases

perc=`df --output=pcent /var | tail -1 | sed 's/%//'` 
$EPICS_BASE/bin/$EPICS_HOST_ARCH/caput $1 $perc
