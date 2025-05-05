require hnoss
require recsync
require iocstats

callbackSetQueueSize(30000)

epicsEnvSet("IOCNAME", "ioc03-hnoss")

iocshLoad("$(hnoss_DIR)/hnoss.iocsh", "PLC_IP=192.168.1.20, TOP=/opt/epics/autosave, IOCNAME=$(IOCNAME)")

# iocStats database
dbLoadRecords("$(iocstats_DB)/iocAdminSoft-freia.db","IOC=$(IOCNAME)")

# Start recsync client
iocshLoad("$(recsync_DIR)/recsync.iocsh", "IOCNAME=$(IOCNAME)")

afterInit(dbpf $(IOCNAME):CBLOW_Q_HIGH.HIGH 600)
afterInit(dbpf $(IOCNAME):CBLOW_Q_HIGH.HIHI 1000)
afterInit(dbpf $(IOCNAME):CBLOW_Q_HIGH.HSV "MINOR")
afterInit(dbpf $(IOCNAME):CBLOW_Q_HIGH.HHSV "MAJOR")

