require fastintrlck
require recsync
require iocstats

epicsEnvSet("IOCNAME", "ioc12-fastintrlck")

iocshLoad("$(fastintrlck_DIR)/fastintrlck.iocsh", "P=IntlkF-cRio1, TOP=/opt/epics/autosave, IOCNAME=$(IOCNAME)")

# iocStats database
dbLoadRecords("$(iocstats_DB)/iocAdminSoft-freia.db","IOC=$(IOCNAME)")

# Start recsync client
iocshLoad("$(recsync_DIR)/recsync.iocsh", "IOCNAME=$(IOCNAME)")

