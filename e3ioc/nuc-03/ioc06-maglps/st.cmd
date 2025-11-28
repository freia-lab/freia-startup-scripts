require maglps
require recsync
require iocstats
require linstat

epicsEnvSet ("IOCNAME", "ioc06-maglps")

iocshLoad("$(maglps_DIR)/maglps.iocsh", "PLC_IP=192.168.1.65")

# iocStats database

dbLoadRecords("$(iocstats_DB)/iocAdminSoft-freia-proc-limited.db","IOC=$(IOCNAME)")
dbLoadRecords("$(linstat_DB)linStatProc.db" ,"IOC=$(IOCNAME)")

# Start recsync client

iocshLoad("$(recsync_DIR)/recsync.iocsh", "IOCNAME=$(IOCNAME)")

