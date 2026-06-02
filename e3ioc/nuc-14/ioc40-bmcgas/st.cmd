require bronkhorst
require epi8600
require siargo

require recsync
require iocstats
require linstat

addScan(60)
addScan(30)
epicsEnvSet("IOCNAME", "ioc40-bmcgas")
#epicsEnvSet("TOP", "/tmp")
epicsEnvSet("TOP", "/opt/epics/autosave")

iocshLoad ("$(bronkhorst_DIR)bronkhorst-eth-ctrl.iocsh", "ASYN_PORT_NAME=PORT1,IP_ADDR=172.16.140.9")
iocshLoad ("$(bronkhorst_DIR)bronkhorst-meter.iocsh", "ASYN_PORT_NAME=PORT1,MODBUS_ADR=1,PREFIX=Env-Gas:,DEV_NAME=CH4-Ar,ASLO=1,SCALE=1")
iocshLoad ("$(bronkhorst_DIR)bronkhorst-eth-ctrl.iocsh", "ASYN_PORT_NAME=PORT2,IP_ADDR=172.16.140.10")
iocshLoad ("$(bronkhorst_DIR)bronkhorst-meter.iocsh", "ASYN_PORT_NAME=PORT2,MODBUS_ADR=1,PREFIX=Env-Gas:,DEV_NAME=C2H2,ASLO=1,SCALE=1")

iocshLoad ("$(siargo_DIR)siargo-eth-ctrl.iocsh", "ASYN_PORT_NAME=PORT3,IP_ADDR=172.16.140.2")
iocshLoad ("$(siargo_DIR)siargo-meter.iocsh", "ASYN_PORT_NAME=PORT3,MODBUS_ADR=1,PREFIX=Env-Gas:,DEV_NAME=CO2,ASLO=0.001,SCALE=1,EGU_FR=Sl/min")
iocshLoad ("$(siargo_DIR)siargo-eth-ctrl.iocsh", "ASYN_PORT_NAME=PORT4,IP_ADDR=172.16.140.3"
iocshLoad ("$(siargo_DIR)siargo-meter.iocsh", "ASYN_PORT_NAME=PORT4,MODBUS_ADR=1,PREFIX=Env-Gas:,DEV_NAME=N2,ASLO=0.001,SCALE=1")
iocshLoad ("$(siargo_DIR)siargo-eth-ctrl.iocsh", "ASYN_PORT_NAME=PORT7,IP_ADDR=172.16.140.4"
iocshLoad ("$(siargo_DIR)siargo-meter.iocsh", "ASYN_PORT_NAME=PORT7,MODBUS_ADR=1,PREFIX=Env-Gas:,DEV_NAME=MedO2,ASLO=0.001,SCALE=1,EGU_FR=Sl/min")
iocshLoad ("$(siargo_DIR)siargo-eth-ctrl.iocsh", "ASYN_PORT_NAME=PORT8,IP_ADDR=172.16.140.5"
iocshLoad ("$(siargo_DIR)siargo-meter.iocsh", "ASYN_PORT_NAME=PORT8,MODBUS_ADR=1,PREFIX=Env-Gas:,DEV_NAME=O2,ASLO=0.001,SCALE=1,EGU_FR=Sl/min")
iocshLoad ("$(siargo_DIR)siargo-eth-ctrl.iocsh", "ASYN_PORT_NAME=PORT9,IP_ADDR=172.16.140.6"
iocshLoad ("$(siargo_DIR)siargo-meter.iocsh", "ASYN_PORT_NAME=PORT9,MODBUS_ADR=1,PREFIX=Env-Gas:,DEV_NAME=MedAir,ASLO=0.001,SCALE=1,EGU_FR=Sl/min")
iocshLoad ("$(siargo_DIR)siargo-eth-ctrl.iocsh", "ASYN_PORT_NAME=PORT10,IP_ADDR=172.16.140.7"
iocshLoad ("$(siargo_DIR)siargo-meter.iocsh", "ASYN_PORT_NAME=PORT10,MODBUS_ADR=1,PREFIX=Env-Gas:,DEV_NAME=He,ASLO=0.001,SCALE=1,EGU_FR=Sl/min")
iocshLoad ("$(siargo_DIR)siargo-eth-ctrl.iocsh", "ASYN_PORT_NAME=PORT11,IP_ADDR=172.16.140.8"
iocshLoad ("$(siargo_DIR)siargo-meter.iocsh", "ASYN_PORT_NAME=PORT11,MODBUS_ADR=1,PREFIX=Env-Gas:,DEV_NAME=Ar,ASLO=0.001,SCALE=1,EGU_FR=Sl/min")

iocshLoad ("$(epi8600_DIR)epi8600-eth-ctrl.iocsh", "ASYN_PORT_NAME=PORT5,IP_ADDR=172.16.140.11")
iocshLoad ("$(epi8600_DIR)epi8600-meter.iocsh", "ASYN_PORT_NAME=PORT5,MODBUS_ADR=1,PREFIX=Env-Gas:,DEV_NAME=Gasol,ASLO=1,SCALE=1")
iocshLoad ("$(epi8600_DIR)epi8600-eth-ctrl.iocsh", "ASYN_PORT_NAME=PORT6,IP_ADDR=172.16.140.12")
iocshLoad ("$(epi8600_DIR)epi8600-meter.iocsh", "ASYN_PORT_NAME=PORT6,MODBUS_ADR=1,PREFIX=Env-Gas:,DEV_NAME=H2,ASLO=1,SCALE=1")


dbLoadRecords("asynRecord.db", "P=${IOCNAME},R=:asynRec,PORT=$(ASYN_PORT=PORT1),ADDR='0',IMAX='1024',OMAX='256'")

iocshLoad("$(autosave_DIR)/autosave.iocsh", "AS_TOP=$(TOP),IOCNAME=$(IOCNAME),IOCDIR=$(IOCDIR=bmcgas)")

# iocStats database
dbLoadRecords("$(iocstats_DB)iocAdminSoft-freia-proc-limited.db","IOC=$(IOCNAME)")
dbLoadRecords("$(linstat_DB)linStatProc.db" ,"IOC=$(IOCNAME)")

# Load the recsync client's database
iocshLoad("$(recsync_DIR)/recsync.iocsh", "IOCNAME=$(IOCNAME)")
