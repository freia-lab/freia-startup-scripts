require rexroth

require recsync
require iocstats
require linstat



epicsEnvSet("IOCNAME", "ioc26-rexroth")
epicsEnvSet("TOP", "/opt/epics/autosave")

# Limit the error messages form the StreamDevice (specially when the device is not connected)
var streamErrorDeadTime 60

iocshLoad("$(rexroth_DIR)rexroth.iocsh", "IP=localhost,P=CstatV-AC:,IP_PORT=2195,IOCNAME=ioc26-rexroth")

#iocshLoad("$(autosave_DIR)/autosave.iocsh", "AS_TOP=$(TOP),IOCNAME=$(IOCNAME),IOCDIR=$(IOCDIR=rexroth)")

# iocStats database
dbLoadRecords("$(iocstats_DB)/iocAdminSoft-freia-proc-limited.db","IOC=${IOCNAME}")
dbLoadRecords("$(linstat_DB)linStatProc.db" ,"IOC=$(IOCNAME)")

#iocshLoad("$(iocstats_DIR)iocStats-host.iocsh","HOSTNAME=ioc26-rexroth")
#iocshLoad("$(iocstats_DIR)iocStats-ioc.iocsh")


# Load the recsync client's database
iocshLoad("$(recsync_DIR)/recsync.iocsh", "IOCNAME=${IOCNAME}")

