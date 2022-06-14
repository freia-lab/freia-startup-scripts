require miscfreia
require recsync
require iocstats

epicsEnvSet ("IOCNAME", "ioc08-misc")

# iocStats database

dbLoadRecords("$(iocstats_DB)/iocAdminSoft-ess.db","IOC=$(IOCNAME)")

iocshLoad("$(miscfreia_DIR)/miscfreia.iocsh",  "TOP=/opt/epics/autosave,IP_ADDR=192.168.1.103,IP_ADDR2=192.168.1.59:1137,IP_ADDR3=192.168.1.58:1137,IP_ADDR4=192.168.10.188:1137")
iocshLoad("$(recsync_DIR)/recsync.iocsh", "IOCNAME=$(IOCNAME)")

