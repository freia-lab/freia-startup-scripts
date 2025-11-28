require laser
require recsync
require iocstats
require linstat

epicsEnvSet("IOCNAME", "ioc20-laser")

#iocshLoad("$(laser_DIR)/laser.iocsh", "IOCNAME=$(IOCNAME)")
iocshLoad("$(laser_DIR)/laser.iocsh", "IOCNAME=ioc20-laser, LASER_IP=http://10.1.251.2:20010, OPA_IP=http://10.1.11.11:8004, EPP_IP=http://10.1.11.11:14001, P=Llab-, SCAN='2 second'")

epicsEnvShow PYTHONPATH

pydev("laser.debug=0")

pydev("opa.debug=0")

# iocStats database
dbLoadRecords("$(iocstats_DB)iocAdminSoft-freia-proc-limited.db","IOC=$(IOCNAME)")
dbLoadRecords("$(linstat_DB)linStatProc.db" ,"IOC=$(IOCNAME)")

# Start recsync client
iocshLoad("$(recsync_DIR)/recsync.iocsh", "IOCNAME=ioc20-laser")

