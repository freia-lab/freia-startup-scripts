require recsync
require iocstats
require linstat
require autosave
require afterinit

epicsEnvSet("IOCNAME", "ioc99-nuc02")


# iocStats 

iocshLoad("$(linstat_DIR)host-2FS-1NIC.iocsh", "IOC=Ctrl-nuc02,FS1=run,FS2=var,NIC1=eno1")
dbLoadRecords("$(linstat_DB)linStatNIC.db","IOC=Ctrl-nuc02,NIC=enx00249b13a113")

dbLoadRecords("$(iocstats_DB)iocAdminSoft-freia-host-limited.db","IOC=Ctrl-nuc02")

# Start recsync client
iocshLoad("$(recsync_DIR)recsync.iocsh", "IOCNAME=$(IOCNAME)")

# Start autosave
iocshLoad("$(autosave_DIR)autosave.iocsh", "AS_TOP=/opt/epics/autosave,IOCNAME=$(IOCNAME),IOCDIR=ctrl-nuc02")
