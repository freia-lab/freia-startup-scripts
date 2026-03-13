require recsync
require iocstats
require linstat
require autosave
require afterinit

epicsEnvSet("IOCNAME", "ioc99-oldpc05")


# iocStats 

#iocshLoad("$(linstat_DIR)host-2FS-1NIC.iocsh", "IOC=Ctrl-nuc12,FS1=run,FS2=var,NIC1=enp88s0

dbLoadRecords("$(iocstats_DB)iocAdminSoft-freia-host-limited.db","IOC=Ctrl-oldpc05")
dbLoadRecords("$(linstat_DB)linStatNIC.db","IOC=Ctrl-oldpc05,NIC=eno1")
dbLoadRecords("$(linstat_DB)linStatNIC.db","IOC=Ctrl-oldpc05,NIC=enp4s0")

# Start recsync client
iocshLoad("$(recsync_DIR)recsync.iocsh", "IOCNAME=$(IOCNAME)")

# Start autosave
iocshLoad("$(autosave_DIR)autosave.iocsh", "AS_TOP=/opt/epics/autosave,IOCNAME=$(IOCNAME),IOCDIR=ctrl-oldpc05")
