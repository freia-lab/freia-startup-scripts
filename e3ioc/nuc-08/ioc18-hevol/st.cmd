require hevol
require recsync
require iocstats
require linstat

epicsEnvSet ("IOCNAME", "ioc18-hevol")

# iocStats database

dbLoadRecords("$(iocstats_DB)/iocAdminSoft-freia-proc-limited.db","IOC=$(IOCNAME)")
dbLoadRecords("$(linstat_DB)linStatProc.db" ,"IOC=$(IOCNAME)")

iocshLoad("$(hevol_DIR)/hevol.iocsh", "TOP=/opt/epics/autosave")
iocshLoad("$(recsync_DIR)/recsync.iocsh", "IOCNAME=$(IOCNAME)")

