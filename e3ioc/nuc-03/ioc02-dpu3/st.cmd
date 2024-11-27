require dpu3
require iocstats

epicsEnvSet ("IOCNAME", "ioc02-dpu3")
epicsEnvSet("TOP", "/opt/epics/autosave")
epicsEnvSet("IOCDIR", "radmon-nessa")

require autosave
require afterinit
require recsync

# iocStats database

dbLoadRecords("$(iocstats_DB)/iocAdminSoft-freia.db","IOC=$(IOCNAME)")
 
iocshLoad("$(dpu3_DIR)/dpu3-v1.iocsh", "ASYN_PORT_NAME=PORT1,DPU3_IP=192.168.20.102,DPU3_PREFIX=RadProt-Bunker2:,DET1=GD-01,DET2=GD-02,DET3=GD-03,DET4=ND-01")
dbLoadRecords("asynRecord.db","P=$(IOCNAME),R=:asynRec,PORT='PORT1',ADDR='0',IMAX='1024',OMAX='256'")

asynSetTraceIOMask "PORT1",0,4   # Enable traceIOHex
#asynSetTraceMask "PORT1",0,0x1f     # Enable traceError and traceIODriver
#asynSetTraceMask "PORT1",0,0xfff     # Enable traceError and traceIODriver

# Limit the error messages form the StreamDevice (specially when the device is not connected)
var streamErrorDeadTime 60

iocshLoad("$(autosave_DIR)/autosave.iocsh", "AS_TOP=$(TOP),IOCNAME=$(IOCNAME)")

iocshLoad("$(recsync_DIR)/recsync.iocsh", "IOCNAME=ioc02-dpu3")

