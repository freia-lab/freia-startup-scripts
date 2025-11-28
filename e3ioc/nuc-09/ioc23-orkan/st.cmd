require orkan

require recsync
require iocstats
require afterinit
require linstat

epicsEnvSet("IOCNAME", "ioc23-orkan")
epicsEnvSet("TOP", "/opt/epics/autosave")

# Uncommet the line below for the serial port connection (ModBus RTU)
#iocshLoad ("$(orkan_DIR)orkan.iocsh", "ASYN_PORT_NAME=PORT1,SERIAL_PORT=/dev/ttyUSB0,PREFIX=Cryo-Rec:LP:,DEV_NAME=C4:")

# Connect using Modbus TCP (only Orkan)
# iocshLoad ("$(orkan_DIR)orkan-tcp.iocsh", "ASYN_PORT_NAME=PORT1,IP_ADDR=192.168.10.39,PREFIX=Cryo-Rec:LP:,DEV_NAME=C4:,TOP=/opt/epics/autosave")

# Connect using Modbus TCP (Orkan and Hurricane)
iocshLoad ("$(orkan_DIR)two-compressors-tcp.iocsh", "ASYN_PORT_NAME1=PORT1,IP_ADDR1=192.168.10.39,PREFIX1=Cryo-Rec:LP:,DEV_NAME1=C4:,ASYN_PORT_NAME2=PORT2,IP_ADDR2=192.168.10.54,PREFIX2=Cryo-Rec:LP:,DEV_NAME2=C1:,TOP=/opt/epics/autosave")

# Modify the alarm status for C1 - Cryo-Rec:LP:C1:sAlarm-raw will be set only if C4 and C1 will not be able to cope with eptying the gas bag.
afterInit (dbpf Cryo-Rec:LP:C1:sAlarm-raw.INPC "Cryo-Rec:LP:C4:sAlarm NPP NMS")
afterInit "dbpf Cryo-Rec:LP:C1:sAlarm-raw.CALC \(C=1\)&&\(A=1\)?\(\(B#9\)&&\(B#13\)\):0"

var(reccastTimeout, 5.0)
var(reccastMaxHoldoff, 5.0)

# iocStats database
dbLoadRecords("$(iocstats_DB)/iocAdminSoft-freia-proc-limited.db","IOC=${IOCNAME}")
dbLoadRecords("$(linstat_DB)linStatProc.db" ,"IOC=$(IOCNAME)")

# Load the recsync client's database
iocshLoad("$(recsync_DIR)/recsync.iocsh", "IOCNAME=${IOCNAME}")

