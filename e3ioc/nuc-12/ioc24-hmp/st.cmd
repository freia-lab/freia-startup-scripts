require hmp40x0
require recsync
require iocstats

# Limit the error messages form the StreamDevice (specially when the device is not conn
ected)
var streamErrorDeadTime 60

#iocshLoad("$(hmp40x0_DIR)hmp4040.iocsh", "IP=192.168.10.45,P=CstatV-AC:,IOCNAME=ioc24-hmp")
iocshLoad("$(hmp40x0_DIR)hmp4040x2.iocsh", "IP1=192.168.10.50,P1=CstatV-AC1:,IP2=192.168.10.45,P2=CstatV-AC:,IOCNAME=ioc24-hmp")


# iocStats database
dbLoadRecords("$(iocstats_DB)/iocAdminSoft-freia.db","IOC=ioc24-hmp")

# Start recsync client
iocshLoad("$(recsync_DIR)/recsync.iocsh", "IOCNAME=ioc24-hmp")

