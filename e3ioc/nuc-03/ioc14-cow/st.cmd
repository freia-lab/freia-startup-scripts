require cow
require recsync
require iocstats

epicsEnvSet("IOCNAME", "ioc14-cow")

# iocStats database
dbLoadRecords("$(iocstats_DB)/iocAdminSoft-ess.db","IOC=$(IOCNAME)")

iocshLoad("$(cow_DIR)/cow.iocsh", "COW_PREFIX=CoW, COW_IP=192.168.1.70")

# Start recsync client
iocshLoad("$(recsync_DIR)/recsync.iocsh", "IOCNAME=$(IOCNAME)")

