require fastintrlck
require recsync
require iocstats
require linstat


epicsEnvSet("IOCNAME", "ioc12-fastintrlck")

iocshLoad("$(fastintrlck_DIR)/fastintrlck.iocsh", "P=IntlkF-cRio1, TOP=/opt/epics/autosave, IOCNAME=$(IOCNAME)")

# General purpose ADC channels
dbLoadRecords("seq-freia-cRIO-ADC.db","P=IntlkF-cRio1, INDX=6, NAME=IntlkF-cRio1:ADC-6:sRdV")
dbLoadRecords("seq-freia-cRIO-ADC.db","P=IntlkF-cRio1, INDX=7, NAME=IntlkF-cRio1:ADC-7:sRdV")
dbLoadRecords("seq-freia-cRIO-ADC.db","P=IntlkF-cRio1, INDX=8, NAME=IntlkF-cRio1:ADC-8:sRdV")
dbLoadRecords("seq-freia-cRIO-ADC.db","P=IntlkF-cRio1, INDX=9, NAME=IntlkF-cRio1:ADC-9:sRdV")
dbLoadRecords("seq-freia-cRIO-ADC.db","P=IntlkF-cRio1, INDX=10, NAME=IntlkF-cRio1:ADC-10:sRdV")
dbLoadRecords("seq-freia-cRIO-ADC.db","P=IntlkF-cRio1, INDX=11, NAME=IntlkF-cRio1:ADC-11:sRdV")
dbLoadRecords("seq-freia-cRIO-ADC.db","P=IntlkF-cRio1, INDX=12, NAME=IntlkF-cRio1:ADC-12:sRdV")
dbLoadRecords("seq-freia-cRIO-ADC.db","P=IntlkF-cRio1, INDX=13, NAME=IntlkF-cRio1:ADC-13:sRdV")
dbLoadRecords("seq-freia-cRIO-ADC.db","P=IntlkF-cRio1, INDX=14, NAME=IntlkF-cRio1:ADC-14:sRdV")
dbLoadRecords("seq-freia-cRIO-ADC.db","P=IntlkF-cRio1, INDX=15, NAME=IntlkF-cRio1:ADC-15:sRdV")

# iocStats database
dbLoadRecords("$(iocstats_DB)/iocAdminSoft-freia-proc-limited.db","IOC=$(IOCNAME)")
dbLoadRecords("$(linstat_DB)linStatProc.db" ,"IOC=$(IOCNAME)")

# Start recsync client
iocshLoad("$(recsync_DIR)/recsync.iocsh", "IOCNAME=$(IOCNAME)")

