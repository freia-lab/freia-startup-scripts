require recsync
require iocstats
require linstat
require autosave
require afterinit

epicsEnvSet("IOCNAME", "ioc99-nuc03")


# iocStats 

iocshLoad("$(linstat_DIR)host-2FS-1NIC.iocsh", "IOC=Ctrl-nuc03,FS1=run,FS2=var,NIC1=eno1")
dbLoadRecords("$(linstat_DB)linStatNIC.db","IOC=Ctrl-nuc03,NIC=enx00249b488e29")
dbLoadRecords("$(linstat_DB)linStatNIC.db","IOC=Ctrl-nuc03,NIC=enx00249b488e2a")

dbLoadRecords("$(iocstats_DB)iocAdminSoft-freia-host-limited.db","IOC=Ctrl-nuc03")

# Start recsync client
iocshLoad("$(recsync_DIR)recsync.iocsh", "IOCNAME=$(IOCNAME)")

# Start autosave
iocshLoad("$(autosave_DIR)autosave.iocsh", "AS_TOP=/opt/epics/autosave,IOCNAME=$(IOCNAME),IOCDIR=ctrl-nuc03")
