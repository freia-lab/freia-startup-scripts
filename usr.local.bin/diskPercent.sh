#!/bin/bash
EPICS_BASE=/epics/base-7.0.7
EPICS_HOST_ARCH=linux-x86_64

perc=`df --output=pcent /var | tail -1 | sed 's/%//'` 
$EPICS_BASE/bin/$EPICS_HOST_ARCH/caput $1 $perc
