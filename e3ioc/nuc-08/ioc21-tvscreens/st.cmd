require tvscreens
require recsync
require iocstats

iocshLoad("$(tvscreens_DIR)tvscreens.iocsh",  "TOP=/opt/epics/autosave")

# iocStats database
dbLoadRecords("$(iocstats_DB)/iocAdminSoft-ess.db","IOC=ioc21-tvscreens")

# Start recsync client
iocshLoad("$(recsync_DIR)/recsync.iocsh", "IOCNAME=ioc21-tvscreens")

