require gersemi
require recsync
require iocstats
require afterinit

epicsEnvSet("IOCNAME", "ioc11-gersemi")

callbackSetQueueSize(30000)
dbPvdTableSize(1024)

iocshLoad("$(gersemi_DIR)/gersemi.iocsh", "PLC_IP=192.168.1.30, TOP=/opt/epics/autosave, IOCNAME=$(IOCNAME)")

# iocStats database
dbLoadRecords("$(iocstats_DB)/iocAdminSoft-freia.db","IOC=$(IOCNAME)")

dbLoadRecords("asynRecord.db","P=${IOCNAME},R=:asynRec,PORT=G_S7,ADDR='0',IMAX='1024',OMAX='256'")

# Start recsync client
iocshLoad("$(recsync_DIR)/recsync.iocsh", "IOCNAME=$(IOCNAME)")

afterInit(dbpf ioc11-gersemi:CBLOW_Q_HIGH.HIGH 600)
afterInit(dbpf ioc11-gersemi:CBLOW_Q_HIGH.HIHI 1000)
afterInit(dbpf ioc11-gersemi:CBLOW_Q_HIGH.HSV "MINOR")
afterInit(dbpf ioc11-gersemi:CBLOW_Q_HIGH.HHSV "MAJOR")

