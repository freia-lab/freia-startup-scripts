require hnoss
require recsync
require iocstats

epicsEnvSet("IOCNAME", "ioc03-hnoss")

iocshLoad("$(hnoss_DIR)/hnoss.iocsh", "PLC_IP=192.168.1.20, TOP=/opt/epics/autosave, IOCNAME=$(IOCNAME)")

# iocStats database
dbLoadRecords("$(iocstats_DB)/iocAdminSoft-freia.db","IOC=$(IOCNAME)")

# Start recsync client
iocshLoad("$(recsync_DIR)/recsync.iocsh", "IOCNAME=$(IOCNAME)")

