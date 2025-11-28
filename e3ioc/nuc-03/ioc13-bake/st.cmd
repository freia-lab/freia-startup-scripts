require bakeout
require recsync
require iocstats
require linstat

epicsEnvSet("IOCNAME", "ioc13-bake")

iocshLoad("$(bakeout_DIR)/bakeout.iocsh",  "IP_ADDR=192.168.1.104:2020, IOCNAME=$(IOCNAME)")

# iocStats database
dbLoadRecords("$(iocstats_DB)/iocAdminSoft-freia-proc-limited.db","IOC=$(IOCNAME)")
dbLoadRecords("$(linstat_DB)linStatProc.db" ,"IOC=$(IOCNAME)")

# Start recsync client
iocshLoad("$(recsync_DIR)/recsync.iocsh", "IOCNAME=$(IOCNAME)")

