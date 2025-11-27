require recsync
require iocstats
require linstat
require autosave
require afterinit

#callbackSetQueueSize(30000)

epicsEnvSet("IOCNAME", "ioc99-nuc01")


# iocStats 

iocshLoad("$(linstat_DIR)host-2FS-1NIC.iocsh", "IOC=Ctrl-nuc01,FS1=run,FS2=var,NIC1=eno1")
dbLoadRecords("$(linstat_DB)linStatNIC.db","IOC=Ctrl-nuc01,NIC=enx000ec6f92147")

dbLoadRecords("$(iocstats_DB)iocAdminSoft-freia-host-limited.db","IOC=Ctrl-nuc01")

# Start recsync client
iocshLoad("$(recsync_DIR)recsync.iocsh", "IOCNAME=$(IOCNAME)")

# Start autosave
iocshLoad("$(autosave_DIR)autosave.iocsh", "AS_TOP=/opt/epics/autosave,IOCNAME=$(IOCNAME),IOCDIR=ctrl-nuc01")
