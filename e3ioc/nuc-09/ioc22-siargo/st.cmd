require siargo
require recsync
require iocstats

iocshLoad ("$(siargo_DIR)siargo-ctrl.iocsh", "ASYN_PORT_NAME=PORT1,SERIAL_PORT=/dev/ttyUSB0,TOP=/opt/epics/autosave")
iocshLoad ("$(siargo_DIR)siargo-meter.iocsh", "ASYN_PORT_NAME=PORT1,MODBUS_ADR=1,PREFIX=Env-Gas:,DEV_NAME=MFM-FREIA")

# iocStats database
dbLoadRecords("$(iocstats_DB)/iocAdminSoft-freia.db","IOC=ioc22-siargo")

# Start recsync client
iocshLoad("$(recsync_DIR)/recsync.iocsh", "IOCNAME=ioc22-siargo")

