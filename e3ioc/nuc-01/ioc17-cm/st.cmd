require cm
require recsync
require iocstats
require linstat

epicsEnvSet("IOCNAME", "ioc17-cm")

iocshLoad("$(cm_DIR)/cm.iocsh", "PLC_IP=192.168.1.11, TOP=/opt/epics/autosave, IOCNAME=$(IOCNAME)")

# iocStats database
dbLoadRecords("$(iocstats_DB)iocAdminSoft-freia-proc-limited.db","IOC=$(IOCNAME)")
dbLoadRecords("$(linstat_DB)linStatProc.db" ,"IOC=$(IOCNAME)")

# Start recsync client
iocshLoad("$(recsync_DIR)/recsync.iocsh", "IOCNAME=$(IOCNAME)")


#dbpf CM-VBox:LT03:sRdV.LOLO 2
#dbpf CM-CM:LT01:sRdV.LOLO 2
#dbpf CM-VBox:LT03:sRdV.HYST 3
#dbpf CM-CM:LT01:sRdV.HYST 3

