require bakeout
require recsync
require iocstats

iocshLoad("$(bakeout_DIR)/bakeout.iocsh",  "IP_ADDR=192.168.1.104:2020, IOCNAME=ioc13-bake")

# iocStats database
dbLoadRecords("$(iocstats_DB)/iocAdminSoft-freia.db","IOC=ioc13-bake")

# Start recsync client
iocshLoad("$(recsync_DIR)/recsync.iocsh", "IOCNAME=ioc13-bake")

