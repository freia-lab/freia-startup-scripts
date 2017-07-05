#require rfleakdet-freia,konrad
require rfleakdet-freia,0.1+
epicsEnvSet("RFLEAK_PORT", "RFLEAKDET")

drvAsynIPPortConfigure(${RFLEAK_PORT}, "192.168.10.9:4002",0,0,0)
#drvAsynIPPortConfigure("PORT", "192.168.10.9:4004",0,0,0)

## Load record instances
dbLoadRecords("rfleakdet-main.db","RFDET_PORT='${RFLEAK_PORT}',PREFIX=''")
dbLoadRecords("rfleakdet.db","RFDET_PORT='${RFLEAK_PORT}',PREFIX='',NODE=0")

