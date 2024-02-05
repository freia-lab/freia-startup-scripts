require heaterctrl

require recsync
require iocstats

addScan(60)
addScan(30)

epicsEnvSet("IOCNAME", "ioc27-htrctrl")
epicsEnvSet("IP", "192.168.10.44")
epicsEnvSet("P", "CstatV-AC:")
epicsEnvSet("TOP", "/opt/epics/autosave")

iocshLoad("$(daq6510_DIR)daq6510_init.iocsh", "ASYN_PORT=DAQ_PORT,IP=192.168.10.44,P=CstatV-AC:")

dbLoadRecords("asynRecord.db","P=${IOCNAME},R=:asynRec,PORT=$(ASYN_PORT=DAQ_PORT),ADDR='0',IMAX='1024',OMAX='256'")
dbLoadRecords("heaterctrl.db", "P=CstatV-AC:, DEV=DAQ6510, PORT=DAQ_PORT")

iocshLoad("$(autosave_DIR)/autosave.iocsh", "AS_TOP=$(TOP),IOCNAME=$(IOCNAME),IOCDIR=$(IOCDIR=daq6510)")

# iocStats database
dbLoadRecords("$(iocstats_DB)/iocAdminSoft-freia.db","IOC=ioc27-htrctrl")

# Load the recsync client's database
iocshLoad("$(recsync_DIR)/recsync.iocsh", "IOCNAME=ioc27-htrctrl")

