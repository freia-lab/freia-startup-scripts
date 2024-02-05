require awakessa

require recsync
require iocstats


epicsEnvSet("IOCNAME", "ioc50-ssa")
epicsEnvSet("TOP", "/opt/epics/autosave")

iocshLoad("$(awakessa_DIR)ssa.iocsh", "TOP=/opt/epics/autosave,IP_ADDR=192.168.10.47,ASYN_PORT=SSA_PORT")
#iocshLoad("$(awakessa_DIR)ssa.iocsh", "TOP=/opt/epics/autosave,IP_ADDR=192.168.1.234,ASYN_PORT=SSA_PORT")



dbLoadRecords("asynRecord.db","P=${IOCNAME},R=:asynRec,PORT=$(ASYN_PORT=SSA_PORT),ADDR='0',IMAX='1024',OMAX='256'")

iocshLoad("$(autosave_DIR)/autosave.iocsh", "AS_TOP=$(TOP),IOCNAME=$(IOCNAME),IOCDIR=$(IOCDIR=awakessa)")

# iocStats database
dbLoadRecords("$(iocstats_DB)/iocAdminSoft-freia.db","IOC=${IOCNAME}")

# Load the recsync client's database
iocshLoad("$(recsync_DIR)/recsync.iocsh", "IOCNAME=${IOCNAME}")

