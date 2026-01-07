require siargo
require recsync
require iocstats
require linstat

iocshLoad ("$(siargo_DIR)siargo-eth-ctrl.iocsh", "ASYN_PORT_NAME=PORT1,IP_ADDR=192.168.10.38,TOP=/opt/epics/autosave")
iocshLoad ("$(siargo_DIR)siargo-eth-ctrl.iocsh", "ASYN_PORT_NAME=PORT2,IP_ADDR=130.238.22.3,TIME_OUT=4200,TOP=/opt/epics/autosave")

iocshLoad ("$(siargo_DIR)siargo-meter.iocsh", "ASYN_PORT_NAME=PORT1,MODBUS_ADR=1,PREFIX=Env-Gas:,DEV_NAME=MFM-FREIA,ASLO=0.001,SCALE=1")
iocshLoad ("$(siargo_DIR)siargo-meter.iocsh", "ASYN_PORT_NAME=PORT2,MODBUS_ADR=1,PREFIX=Env-Gas:,DEV_NAME=MFM-Hus3,ASLO=0.00006,SCALE=0.001")

# iocStats database
dbLoadRecords("$(iocstats_DB)/iocAdminSoft-freia-proc-limited.db","IOC=ioc22-siargo")
dbLoadRecords("$(linstat_DB)linStatProc.db" ,"IOC=$(IOCNAME)")

# Start recsync client
iocshLoad("$(recsync_DIR)/recsync.iocsh", "IOCNAME=ioc22-siargo")

