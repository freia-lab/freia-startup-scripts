

require smbv100a
require asyn
require stream
require linstat
require iocstats

epicsEnvSet ("IOCNAME", "ioc41-smbv100a")

#Specify the TCP endpoint and give your 'bus' an arbitrary name eg. "asynstream1".
drvAsynIPPortConfigure("PORT1","192.168.10.34:5025",0,0,0)

#Indicate the folder where the MB100A protocol file is installed
epicsEnvSet("STREAM_PROTOCOL_PATH","$(smbv100a_DB)")

#Load your database defining the EPICS records

dbLoadRecords("$(iocstats_DB)/iocAdminSoft-freia-proc-limited.db","IOC=$(IOCNAME)")
dbLoadRecords("$(linstat_DB)linStatProc.db" ,"IOC=$(IOCNAME)")
dbLoadRecords("smbv100a.db", "PORT=PORT1,P=LLRF-VSGEN,DEV=SMBV100A")
