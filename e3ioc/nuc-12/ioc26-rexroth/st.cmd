require rexroth

require recsync
require iocstats


epicsEnvSet("IOCNAME", "ioc26-rexroth")
epicsEnvSet("TOP", "/opt/epics/autosave")

# Limit the error messages form the StreamDevice (specially when the device is not connected)
var streamErrorDeadTime 60

iocshLoad("$(rexroth_DIR)rexroth.iocsh", "IP=localhost,P=CstatV-AC:,IP_PORT=2195,IOCNAME=ioc26-rexroth")

#iocshLoad("$(autosave_DIR)/autosave.iocsh", "AS_TOP=$(TOP),IOCNAME=$(IOCNAME),IOCDIR=$(IOCDIR=rexroth)")

# iocStats database
dbLoadRecords("$(iocstats_DB)/iocAdminSoft-freia.db","IOC=${IOCNAME}")

# Load the recsync client's database
iocshLoad("$(recsync_DIR)/recsync.iocsh", "IOCNAME=${IOCNAME}")

