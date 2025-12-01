require heaterctrl

require recsync
require iocstats
require linstat

addScan(60)
addScan(30)
epicsEnvSet("IOCNAME", "ioc27-htrctrl")
epicsEnvSet("IP", "192.168.10.44")
epicsEnvSet("P", "CstatV-AC:")
epicsEnvSet("P_HMP1", "CstatV-AC1:")
epicsEnvSet("P_HMP2", "CstatV-AC2:")
epicsEnvSet("TOP", "/opt/epics/autosave")

drvAsynIPPortConfigure("PORT1","192.168.10.50:5025",0,0,0)
drvAsynIPPortConfigure("PORT2","192.168.10.45:5025",0,0,0)

dbLoadRecords("hmp40x0.db", "PORT=PORT1,P=$(P_HMP1),DEV=HMP4040")
dbLoadRecords("hmp40x0.db", "PORT=PORT2,P=$(P_HMP2),DEV=HMP4040")

iocshLoad("$(daq6510_DIR)daq6510_init.iocsh", "ASYN_PORT=DAQ_PORT,IP=$(IP),P=$(P)")

dbLoadRecords("asynRecord.db", "P=${IOCNAME},R=:asynRec,PORT=$(ASYN_PORT=DAQ_PORT),ADDR='0',IMAX='1024',OMAX='256'")
dbLoadRecords("heaterctrl.db", "P=$(P), DEV=DAQ6510, PORT=DAQ_PORT")
dbLoadRecords("heaterctrl-aliases.db", "P=$(P), PSU1=$(P_HMP1), PSU2=$(P_HMP2), DEV1=DAQ6510, DEV2=HMP4040")

iocshLoad("$(autosave_DIR)/autosave.iocsh", "AS_TOP=$(TOP),IOCNAME=$(IOCNAME),IOCDIR=$(IOCDIR=daq6510)")

# iocStats database
dbLoadRecords("$(iocstats_DB)/iocAdminSoft-freia-proc-limited.db","IOC=ioc27-htrctrl")
dbLoadRecords("$(linstat_DB)linStatProc.db" ,"IOC=$(IOCNAME)")

# Load the recsync client's database
iocshLoad("$(recsync_DIR)/recsync.iocsh", "IOCNAME=ioc27-htrctrl")

