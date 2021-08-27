#require stream,2.8.10
require dpu3,1.0.2

require autosave,5.10.2
 
#Specify the TCP endpoint and give your 'bus' an arbitrary name eg. "asynstream1".
drvAsynIPPortConfigure("PORT1","192.168.20.102:5000",0,0,0)

#drvAsynSerialPortConfigure ("asynport2","/dev/ttyS0")
#asynSetOption ("asynport2", 0, "baud", "9600")
#asynSetOption ("asynport2", 0, "bits", "8")
#asynSetOption ("asynport2", 0, "parity", "none")
#asynSetOption ("asynport2", 0, "stop", "2")
#asynSetOption ("asynport2", 0, "clocal", "N")
#asynSetOption ("asynport2", 0, "crtscts", "N")

#Indicate the folder where the MB100A protocol file is installed
epicsEnvSet("STREAM_PROTOCOL_PATH","$(dpu3_DB)")

#Load your database defining the EPICS records
dbLoadRecords("dpu3.db", "PORT=PORT1,P=RadProt-Bunker2:")

asynSetTraceIOMask "PORT1",0,4   # Enable traceIOHex
#asynSetTraceMask "PORT1",0,0x1f     # Enable traceError and traceIODriver
#asynSetTraceMask "PORT1",0,0xfff     # Enable traceError and traceIODriver

epicsEnvSet("TOP", "/opt/epics/autosave")
epicsEnvSet("IOCNAME", "RadProt-Bunker2")
epicsEnvSet("IOCDIR", "radmon-nessa")

iocshLoad("$(autosave_DIR)/autosave.iocsh", "AS_TOP=$(TOP),IOCNAME=$(IOCNAME)")


iocInit()

