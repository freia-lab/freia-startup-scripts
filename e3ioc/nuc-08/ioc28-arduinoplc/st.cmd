require arduinoplc
require recsync
require iocstats

epicsEnvSet ("IOCNAME", "ioc28-arduinoplc")

# iocStats database

dbLoadRecords("$(iocstats_DB)/iocAdminSoft-freia.db","IOC=$(IOCNAME)")
 
iocshLoad("$(arduinoplc_DIR)/arduinoplc.iocsh", "ASYN_PORT=PORT1,IP_ADDR=192.168.10.40,TOP=/opt/epics/autosave,IOCNAME=ioc28-arduinoplc,PREFIX=LLRF-Aux:,DEV_NAME=ArduinoPMC:")
iocshLoad("$(arduinoplc_DIR)/cav-selector.iocsh")
iocshLoad("$(recsync_DIR)/recsync.iocsh", "IOCNAME=$(IOCNAME)")

