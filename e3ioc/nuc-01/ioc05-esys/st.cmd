require esys
require recsync
require iocstats
# IOCNAME is needed for autosave, recsync and iocstats
epicsEnvSet ("IOCNAME", "ioc05-esys")

iocshLoad("$(esys_DIR)/esys.iocsh", "CCU_IP=192.168.4.40, TOP=/opt/epics/autosave, IOCNAME=$(IOCNAME)")

# iocStats database
dbLoadRecords("$(iocstats_DB)/iocAdminSoft-ess.db","IOC=$(IOCNAME)")

# Start recsync client

iocshLoad("$(recsync_DIR)/recsync.iocsh", "IOCNAME=$(IOCNAME)")

