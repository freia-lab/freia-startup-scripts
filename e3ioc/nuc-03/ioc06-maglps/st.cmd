require maglps
require recsync
require iocstats

epicsEnvSet ("IOCNAME", "ioc06-maglps")

iocshLoad("$(maglps_DIR)/maglps.iocsh", "PLC_IP=192.168.1.65")

# iocStats database

dbLoadRecords("$(iocstats_DB)/iocAdminSoft-ess.db","IOC=$(IOCNAME)")

# Start recsync client

iocshLoad("$(recsync_DIR)/recsync.iocsh", "IOCNAME=$(IOCNAME)")

