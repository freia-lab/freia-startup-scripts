require wtrvac
require recsync
require iocstats

epicsEnvSet("IOCNAME", "ioc04-wtrvac")

iocshLoad("$(wtrvac_DIR)/wtrvac.iocsh", "PLC_IP=192.168.10.10, TOP=/opt/epics/autosave, IOCNAME=$(IOCNAME)")

# iocStats database
dbLoadRecords("$(iocstats_DB)/iocAdminSoft-ess.db","IOC=$(IOCNAME)")

# Start recsync client
iocshLoad("$(recsync_DIR)/recsync.iocsh", "IOCNAME=$(IOCNAME)")

