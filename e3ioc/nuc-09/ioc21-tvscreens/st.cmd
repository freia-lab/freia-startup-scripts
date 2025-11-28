require tvscreens
require recsync
require iocstats
require linstat

iocshLoad("$(tvscreens_DIR)tvscreens.iocsh",  "TOP=/opt/epics/autosave")

# iocStats database
dbLoadRecords("$(iocstats_DB)/iocAdminSoft-freia-proc-limited.db","IOC=ioc21-tvscreens")
dbLoadRecords("$(linstat_DB)linStatProc.db" ,"IOC=$(IOCNAME)")

# Start recsync client
iocshLoad("$(recsync_DIR)/recsync.iocsh", "IOCNAME=ioc21-tvscreens")

