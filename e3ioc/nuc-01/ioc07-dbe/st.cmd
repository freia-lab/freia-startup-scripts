require dbe
require recsync
require iocstats
require linstat

# IOCNAME is needed for autosave, recsync and iocstats
epicsEnvSet ("IOCNAME", "ioc07-dbe")

iocshLoad("$(dbe_DIR)/dbe.iocsh", "PLC1_IP=192.168.1.248,PLC1_PORT=2000, PLC2_IP=192.168.1.247,PLC2_PORT=2000,TOP=/opt/epics/autosave")

# iocStats database

dbLoadRecords("$(iocstats_DB)iocAdminSoft-freia-proc-limited.db","IOC=$(IOCNAME)")
dbLoadRecords("$(linstat_DB)linStatProc.db" ,"IOC=$(IOCNAME)")

# Start recsync client

iocshLoad("$(recsync_DIR)/recsync.iocsh", "IOCNAME=$(IOCNAME)")

