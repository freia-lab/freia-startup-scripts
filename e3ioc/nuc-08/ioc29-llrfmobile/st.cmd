require mobilellrf
# If using the old version with Arduino PLC
#require mobilellrf,1.4.0+2

require recsync
require iocstats

epicsEnvSet ("IOCNAME", "ioc29-llrfmobile")
epicsEnvSet("TOP", "/opt/epics/autosave")
epicsEnvSet("IOCDIR", "llrfmobile")

# iocStats database

dbLoadRecords("$(iocstats_DB)iocAdminSoft-freia.db","IOC=$(IOCNAME)")

# Start-up script for Arduino PMC version (with corresponding module mobilellrf version 1.4.0+2)
#iocshLoad("$(mobilellrf_DIR)mobilellrf.iocsh", "IP_ADDR1=192.168.10.109,PREFIX1=LLRF-1:,DEVICE1=FUNCGEN-1,ASYN_PORT1=PORT1,IP_ADDR2=192.168.10.40,PREFIX2=LLRF-Aux:,DEVICE2=ArduinoPMC:,ASYN_PORT2=PORT2,PREFIX3=LLRF-Ctrl:,IP_ADDR3=192.168.10.31,ASYN_PORT3=PORT3,IP_ADDR4=192.168.10.35,ASYN_PORT4=PORT4")

# Start-up script for the version with SIemens S7-1200 PLC
iocshLoad("$(mobilellrf_DIR)mobilellrf-s7.iocsh", "IP_ADDR1=192.168.10.109,PREFIX1=LLRF-1:,DEVICE1=FUNCGEN-1,ASYN_PORT1=PORT1,IP_ADDR2=192.168.10.47,PREFIX2=LLRF-Ctrl:,ARDUINO_PREFIX=LLRF-Aux:,DEVICE2=ArduinoPMC:,ASYN_PORT2=PLC_PORT,PREFIX3=LLRF-Ctrl:,IP_ADDR3=192.168.10.31,ASYN_PORT3=PORT3,IP_ADDR4=192.168.10.35,ASYN_PORT4=PORT4")

iocshLoad("$(recsync_DIR)recsync.iocsh", "IOCNAME=$(IOCNAME)")

