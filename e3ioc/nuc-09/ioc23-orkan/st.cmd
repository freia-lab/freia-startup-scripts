require orkan

require recsync
require iocstats


epicsEnvSet("IOCNAME", "ioc23-orkan")
epicsEnvSet("TOP", "/opt/epics/autosave")

# Uncommet the line below for the serial port connection (ModBus RTU)
#iocshLoad ("$(orkan_DIR)orkan.iocsh", "ASYN_PORT_NAME=PORT1,SERIAL_PORT=/dev/ttyUSB0,PREFIX=Cryo-Rec:LP:,DEV_NAME=C4:")

# Connect using Modbus TCP
iocshLoad ("$(orkan_DIR)orkan-tcp.iocsh", "ASYN_PORT_NAME=PORT1,IP_ADDR=192.168.10.39,PREFIX=Cryo-Rec:LP:,DEV_NAME=C4:,TOP=/opt/epics/autosave")

var(reccastTimeout, 5.0)
var(reccastMaxHoldoff, 5.0)

#iocshLoad("$(autosave_DIR)/autosave.iocsh", "AS_TOP=$(TOP),IOCNAME=$(IOCNAME),IOCDIR=$(IOCDIR=orkan)")

# iocStats database
dbLoadRecords("$(iocstats_DB)/iocAdminSoft-freia.db","IOC=${IOCNAME}")

# Load the recsync client's database
iocshLoad("$(recsync_DIR)/recsync.iocsh", "IOCNAME=${IOCNAME}")

