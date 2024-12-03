require dpu3
require iocstats

epicsEnvSet ("IOCNAME", "ioc30-dpu3")
epicsEnvSet("TOP", "/opt/epics/autosave")
epicsEnvSet("IOCDIR", "radmon-aux")

require autosave
require afterinit
require recsync

# iocStats database

dbLoadRecords("$(iocstats_DB)/iocAdminSoft-freia.db","IOC=$(IOCNAME)")
iocshLoad("$(dpu3_DIR)/dpu3.iocsh", 'ASYN_PORT_NAME=PORT1,DPU3_IP=192.168.10.52,DPU3_PREFIX=RadProt-Aux:,DET1=GD-00,DET2=GD-01,DET3=GD-02,DET4=GD-03,PROT_VER=v2,SCAN_PERIOD="1 second"')
dbLoadRecords("asynRecord.db","P=$(IOCNAME),R=:asynRec,PORT='PORT1',ADDR='0',IMAX='1024',OMAX='256'")
 
asynSetTraceIOMask "PORT1",0,4   # Enable traceIOHex
#asynSetTraceMask "PORT1",0,0x1f     # Enable traceError and traceIODriver
#asynSetTraceMask "PORT1",0,0xfff     # Enable traceError and traceIODriver

# Limit the error messages form the StreamDevice (specially when the device is not connected)
var streamErrorDeadTime 60

iocshLoad("$(autosave_DIR)/autosave.iocsh", "AS_TOP=$(TOP),IOCNAME=$(IOCNAME)")

iocshLoad("$(recsync_DIR)/recsync.iocsh", "IOCNAME=ioc30-dpu3")

