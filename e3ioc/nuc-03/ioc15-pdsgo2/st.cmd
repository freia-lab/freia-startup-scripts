require pdsgo2
require recsync
require iocstats

epicsEnvSet("IOCNAME", "ioc15-pdsgo2")
epicsEnvSet("TOP", "/opt/epics/autosave")
epicsEnvSet("IOCDIR", "pdsgo2")

require autosave,5.10.2

# iocStats database
dbLoadRecords("$(iocstats_DB)/iocAdminSoft-ess.db","IOC=$(IOCNAME)")

# Limit the error messages form the StreamDevice (specially when the device is not connected)
var streamErrorDeadTime 60

# NOTE:
# A python server program MUST BE RUNNING on the computer to which PDSGO-2 
# dosemeter is connected.
# This program should be started with the command:
# sudo python3 /epics/base-7.0.6.1/require/4.0.0/siteMods/pdsgo2/<MODULE_VERSION>/pdsgo2-server.py

iocshLoad("$(pdsgo2_DIR)pdsgo2.iocsh", ",IP_ADDR=nuc-03,IP_PORT=1140, ASYN_PORT=PORT1")

# Autosave

iocshLoad("$(autosave_DIR)autosave.iocsh", "AS_TOP=/opt/epics/autosave,IOCNAME=$(IOCNAME)")

# Start recsync client
iocshLoad("$(recsync_DIR)/recsync.iocsh", "IOCNAME=$(IOCNAME)")

