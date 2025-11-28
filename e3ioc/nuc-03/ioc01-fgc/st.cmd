require fgcepics
require recsync
require iocstats
require afterinit
require linstat

epicsEnvSet("IOCNAME", "ioc01-fgc")

iocshLoad("$(fgcepics_DIR)/fgcepics.iocsh", "IOCNAME=ioc01-fgc,TOP=/opt/epics/autosave")

# iocStats database
dbLoadRecords("$(iocstats_DB)/iocAdminSoft-freia-proc-limited.db","IOC=ioc01-fgc")
dbLoadRecords("$(linstat_DB)linStatProc.db" ,"IOC=$(IOCNAME)")

# Start recsync client
iocshLoad("$(recsync_DIR)/recsync.iocsh", "IOCNAME=ioc01-fgc")

