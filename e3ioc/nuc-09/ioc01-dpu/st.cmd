require dpu,1.1.1
require iocstats
require linstat

epicsEnvSet ("IOCNAME", "ioc01-dpu")
epicsEnvSet("TOP", "/opt/epics/autosave")
epicsEnvSet("IOCDIR", "radmon-freia")

require afterinit,1.2.1 
require autosave,5.10.2
require recsync

# iocStats database

dbLoadRecords("$(iocstats_DB)/iocAdminSoft-freia-proc-limited.db","IOC=$(IOCNAME)")
dbLoadRecords("$(linstat_DB)linStatProc.db" ,"IOC=$(IOCNAME)")

iocshLoad("$(dpu_DIR)/dpu.iocsh", "ASYN_PORT_NAME=PORT1, DPU_IP='192.168.10.5', DPU_PORT=4001,DPU_PREFIX=RadProt-")

#Load your database defining the EPICS records
#dbLoadRecords("dpu.db", "PORT=PORT1,P=RadProt-,DET1=Office:GD-01,DET2=Bunker1:GD-01,DET3=Bunker1:GD-02,DET4=Bunker1:GD-03")

dbLoadRecords("asynRecord.db","P=$(IOCNAME),R=:asynRec,PORT='PORT1',ADDR='0',IMAX='1024',OMAX='256'")

asynSetTraceIOMask "PORT1",0,4   # Enable traceIOHex

iocshLoad("$(autosave_DIR)/autosave.iocsh", "AS_TOP=$(TOP),IOCNAME=$(IOCNAME)")
iocshLoad("$(recsync_DIR)/recsync.iocsh", "IOCNAME=$(IOCNAME)")

