require superv
require recsync
require iocstats
require autosave
require iocstats

epicsEnvSet ("IOCNAME", "ioc03-service")
# Directory name for the autosave files
epicsEnvSet ("IOCDIR", "service")

# For calculation of operating times

dbLoadRecords '$(superv_DB)totOpTime.db','P=CstatH-2Kpumps:P3B,sOn=sOn'
dbLoadRecords '$(superv_DB)totOpTime.db','P=CstatH-2Kpumps:P1C,sOn=sOn'
dbLoadRecords '$(superv_DB)totOpTime.db','P=CstatH-2Kpumps:P1D,sOn=sOn'
dbLoadRecords '$(superv_DB)totOpTime.db','P=CstatH-2Kpumps:P3A,sOn=sOn'
dbLoadRecords '$(superv_DB)totOpTime.db','P=CstatH-2Kpumps:P1A,sOn=sOn'
dbLoadRecords '$(superv_DB)totOpTime.db','P=CstatH-2Kpumps:P1B,sOn=sOn'
dbLoadRecords '$(superv_DB)totOpTime.db','P=CstatH-2Kpumps:P2,sOn=sOn'
dbLoadRecords '$(superv_DB)totOpTime.db','P=Llab-Laser,sON=sOn'

# For service data

# 2K Pumps
#
#dbLoadRecords '$(superv_DB)totOpTime.db','P=xxx'
dbLoadRecords '$(superv_DB)service.db','P=CstatH-2Kpumps:P1A,N=1'
#dbLoadRecords '$(superv_DB)service.db','P=CstatH-2Kpumps:P1A,N=2'
#dbLoadRecords '$(superv_DB)service.db','P=CstatH-2Kpumps:P1A,N=3'
#dbLoadRecords '$(superv_DB)service-common.db', 'P=CstatH-2Kpumps:P1A'
dbLoadRecords '$(superv_DB)service-common.db', 'P=CstatH-2Kpumps:P1A,S2="",S2="",S3="",S=A'

dbLoadRecords '$(superv_DB)service.db','P=CstatH-2Kpumps:P1B,N=1'
#dbLoadRecords '$(superv_DB)service.db','P=CstatH-2Kpumps:P1B,N=2'
#dbLoadRecords '$(superv_DB)service.db','P=CstatH-2Kpumps:P1B,N=3'
dbLoadRecords '$(superv_DB)service-common.db', 'P=CstatH-2Kpumps:P1B,S2="",S3="",S="A"'
#dbLoadRecords '$(superv_DB)service-common.db', 'P=CstatH-2Kpumps:P1B,S2="",S3="",S=A'

dbLoadRecords '$(superv_DB)service.db','P=CstatH-2Kpumps:P1C,N=1'
dbLoadRecords '$(superv_DB)service-common.db', 'P=CstatH-2Kpumps:P1C,S2="",S2="",S3="",S=A'

dbLoadRecords '$(superv_DB)service.db','P=CstatH-2Kpumps:P1D,N=1'
dbLoadRecords '$(superv_DB)service-common.db', 'P=CstatH-2Kpumps:P1D,S2="",S2="",S3="",S=A'

dbLoadRecords '$(superv_DB)service.db','P=CstatH-2Kpumps:P2,N=1'
dbLoadRecords '$(superv_DB)service-common.db', 'P=CstatH-2Kpumps:P2,S2="",S3="",S=A'

dbLoadRecords '$(superv_DB)service.db','P=CstatH-2Kpumps:P3A,N=1'
dbLoadRecords '$(superv_DB)service-common.db', 'P=CstatH-2Kpumps:P3A,S2="",S3="",S=A'

dbLoadRecords '$(superv_DB)service.db','P=CstatH-2Kpumps:P3B,N=1'
dbLoadRecords '$(superv_DB)service-common.db', 'P=CstatH-2Kpumps:P3B,S2="",S3="",S=A'

# Turbo pumps
#
dbLoadRecords '$(superv_DB)service.db','P=CstatH-Vac:TP001,N=1'
dbLoadRecords '$(superv_DB)service-common.db', 'P=CstatH-Vac:TP001,S2="",S3="",S=A'

dbLoadRecords '$(superv_DB)service.db','P=CstatH-Vac:TP002,N=1'
dbLoadRecords '$(superv_DB)service-common.db', 'P=CstatH-Vac:TP002,S2="",S3="",S=A'

dbLoadRecords '$(superv_DB)service.db','P=CstatV-Vac:TP050,N=1'
dbLoadRecords '$(superv_DB)service-common.db', 'P=CstatV-Vac:TP050,S2="",S3="",S=A'

dbLoadRecords '$(superv_DB)service.db','P=CstatV-Vac:TP060,N=1'
dbLoadRecords '$(superv_DB)service-common.db', 'P=CstatV-Vac:TP060,S2="",S3="",S=A'

# Water pumps
#
dbLoadRecords '$(superv_DB)service.db','P=WtrC-Dwtr:P1,N=1'
dbLoadRecords '$(superv_DB)service-common.db', 'P=WtrC-Dwtr:P1,S2="",S3="",S=A'

dbLoadRecords '$(superv_DB)service.db','P=WtrC-Dwtr:P2,N=1'
dbLoadRecords '$(superv_DB)service-common.db', 'P=WtrC-Dwtr:P2,S2="",S3="",S=A'

# Password token for alarm-config-logger GitHub repository
#
dbLoadRecords '$(superv_DB)service.db','P=Ctrl-Alarm:PasswToken,OPTIME=0'

# Autosave

iocshLoad("$(autosave_DIR)autosave.iocsh", "AS_TOP=/opt/epics/autosave,IOCNAME=$(IOCNAME)")

# iocStats database

dbLoadRecords("$(iocstats_DB)/iocAdminSoft-ess.db","IOC=$(IOCNAME)")

# Start recsync client

iocshLoad("$(recsync_DIR)/recsync.iocsh", "IOCNAME=$(IOCNAME)")

