require fgcepics
require recsync
require iocstats

iocshLoad("$(fgcepics_DIR)/fgcepics.iocsh", "IOCNAME=ioc01-fgc,TOP=/opt/epics/autosave")

# iocStats database
dbLoadRecords("$(iocstats_DB)/iocAdminSoft-ess.db","IOC=ioc01-fgc")

# Start recsync client
iocshLoad("$(recsync_DIR)/recsync.iocsh", "IOCNAME=ioc01-fgc")

