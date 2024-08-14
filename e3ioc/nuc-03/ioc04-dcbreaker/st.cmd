require dcbreaker
require iocstats
 
require recsync

epicsEnvSet ("IOCNAME", "ioc04-dcbreaker")

# iocStats database

dbLoadRecords("$(iocstats_DB)/iocAdminSoft-freia.db","IOC=$(IOCNAME)")
 
iocshLoad("$(dcbreaker_DIR)/dcbreaker.iocsh", "ASYN_PORT_NAME=PORT1,DCBREAKER_IP=192.168.10.42,PREFIX=MAG-,DEV_NAME=EE-1:")
iocshLoad("$(dcbreaker_DIR)/dcbreaker.iocsh", "ASYN_PORT_NAME=PORT2,DCBREAKER_IP=192.168.10.43,PREFIX=MAG-,DEV_NAME=EE-2:")

dbLoadRecords("asynRecord.db","P=$(IOCNAME),R=:asynRec,PORT='PORT1',ADDR='0',IMAX='1024',OMAX='256'")
iocshLoad("$(recsync_DIR)/recsync.iocsh", "IOCNAME=$(IOCNAME)")

