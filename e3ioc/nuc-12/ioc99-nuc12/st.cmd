require recsync
require iocstats
require linstat
require autosave
require afterinit

epicsEnvSet("IOCNAME", "ioc99-nuc12")


# iocStats 

#iocshLoad("$(linstat_DIR)host-2FS-1NIC.iocsh", "IOC=Ctrl-nuc12,FS1=run,FS2=var,NIC1=enp88s0

dbLoadRecords("$(iocstats_DB)iocAdminSoft-freia-host-limited.db","IOC=Ctrl-nuc12")
dbLoadRecords("$(linstat_DB)linStatHost.db","IOC=Ctrl-nuc12")
dbLoadRecords("$(linstat_DB)linStatNIC.db","IOC=Ctrl-nuc12,NIC=enp88s0")
dbLoadRecords("$(linstat_DB)linStatFS.db","P=Ctrl-nuc12:disk-root,DIR=/")
dbLoadRecords("$(linstat_DB)linStatFS.db","P=Ctrl-nuc12:disk-boot,DIR=/boot")
dbLoadRecords("$(linstat_DB)linStatFS.db","P=Ctrl-nuc12:disk-bootefi,DIR=/boot/efi")

# Start recsync client
iocshLoad("$(recsync_DIR)recsync.iocsh", "IOCNAME=$(IOCNAME)")

# Start autosave
iocshLoad("$(autosave_DIR)autosave.iocsh", "AS_TOP=/opt/epics/autosave,IOCNAME=$(IOCNAME),IOCDIR=ctrl-nuc12")
