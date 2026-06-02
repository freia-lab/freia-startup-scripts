require recsync
require iocstats
require linstat
require autosave
require afterinit

epicsEnvSet("IOCNAME", "ioc99-nuc14")


# iocStats 

#iocshLoad("$(linstat_DIR)host-2FS-1NIC.iocsh", "IOC=Ctrl-nuc14,FS1=root,FS2=boot,NIC1=enp86s0

dbLoadRecords("$(iocstats_DB)iocAdminSoft-freia-host-limited.db","IOC=Ctrl-nuc14")
dbLoadRecords("$(linstat_DB)linStatHost.db","IOC=Ctrl-nuc14")
dbLoadRecords("$(linstat_DB)linStatNIC.db","IOC=Ctrl-nuc14,NIC=enp86s0")
dbLoadRecords("$(linstat_DB)linStatFS.db","P=Ctrl-nuc14:disk-root,DIR=/")
dbLoadRecords("$(linstat_DB)linStatFS.db","P=Ctrl-nuc14:disk-boot,DIR=/boot/efi")

# Start recsync client
iocshLoad("$(recsync_DIR)recsync.iocsh", "IOCNAME=$(IOCNAME)")

# Start autosave
iocshLoad("$(autosave_DIR)autosave.iocsh", "AS_TOP=/opt/epics/autosave,IOCNAME=$(IOCNAME),IOCDIR=ctrl-nuc14")
