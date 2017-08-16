#require rfleakdet-freia,konrad
require rfleakdet-freia,1.0+
epicsEnvSet("RFLEAK_PORT", "RFLEAKDET")

drvAsynIPPortConfigure(${RFLEAK_PORT}, "192.168.10.9:4002",0,0,0)
#drvAsynIPPortConfigure("PORT", "192.168.10.9:4004",0,0,0)

dbLoadRecords("asynRecord.db","P='Env-RFleakage',R=:asynRec,PORT='${RFLEAK_PORT}',ADDR='0',IMAX='1024',OMAX='256'")
## Load record instances
dbLoadRecords("rfleakdet-main.db","RFDET_PORT='${RFLEAK_PORT}',PREFIX='Env-RFleakage'")
dbLoadRecords("rfleakdet.db","RFDET_PORT='${RFLEAK_PORT}',PREFIX='Env-RFleakage',NODE=0")
dbLoadRecords("rfleakdet.db","RFDET_PORT='${RFLEAK_PORT}',PREFIX='Env-RFleakage',NODE=1")
dbLoadRecords("rfleakdet.db","RFDET_PORT='${RFLEAK_PORT}',PREFIX='Env-RFleakage',NODE=2")
dbLoadRecords("rfleakdet.db","RFDET_PORT='${RFLEAK_PORT}',PREFIX='Env-RFleakage',NODE=3")
