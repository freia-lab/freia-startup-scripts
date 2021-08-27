require dpu,1.0.1
 
require autosave,5.10.2
 
#Specify the TCP endpoint and give your 'bus' an arbitrary name eg. "asynstream1".
drvAsynIPPortConfigure("PORT1","192.168.10.5:4001",0,0,0)

#drvAsynSerialPortConfigure ("asynport2","/dev/ttyS0")
#asynSetOption ("asynport2", 0, "baud", "9600")
#asynSetOption ("asynport2", 0, "bits", "8")
#asynSetOption ("asynport2", 0, "parity", "none")
#asynSetOption ("asynport2", 0, "stop", "2")
#asynSetOption ("asynport2", 0, "clocal", "N")
#asynSetOption ("asynport2", 0, "crtscts", "N")

#Indicate the folder where the protocol file is installed
epicsEnvSet("STREAM_PROTOCOL_PATH","$(dpu_DB)")

#Load your database defining the EPICS records
dbLoadRecords("dpu.db", "PORT=PORT1,P=RadProt-,DET1=Office:GD-01,DET2=Bunker1:GD-01,DET3=Bunker1:GD-02,DET4=Bunker1:GD-03")

#dbLoadDatabase("dpu-loc/dpuApp/src/subroutine.dbd")


asynSetTraceIOMask "PORT1",0,4   # Enable traceIOHex
#asynSetTraceMask "PORT1",0,0x1f     # Enable traceError and traceIODriver
#asynSetTraceMask "PORT1",0,0xfff     # Enable traceError and traceIODriver

epicsEnvSet("TOP", "/opt/epics/autosave")
epicsEnvSet("IOCNAME", "RadProt-freia")
epicsEnvSet("IOCDIR", "radmon-freia")

iocshLoad("$(autosave_DIR)/autosave.iocsh", "AS_TOP=$(TOP),IOCNAME=$(IOCNAME)")

iocInit()

