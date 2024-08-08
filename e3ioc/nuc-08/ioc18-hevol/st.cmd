require hevol
require recsync
require iocstats

epicsEnvSet ("IOCNAME", "ioc18-hevol")

# iocStats database

dbLoadRecords("$(iocstats_DB)/iocAdminSoft-freia.db","IOC=$(IOCNAME)")
 
iocshLoad("$(hevol_DIR)/hevol.iocsh", "TOP=/opt/epics/autosave")
iocshLoad("$(recsync_DIR)/recsync.iocsh", "IOCNAME=$(IOCNAME)")

