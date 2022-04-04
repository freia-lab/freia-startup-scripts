# General configuration
EPICS_BASE=/epics/base-7.0.6.1
EPICS_DRIVER_PATH=/epics/base-7.0.6.1/require/4.0.0/siteMods
EPICS_HOST_ARCH=linux-x86_64
#EPICS_CA_ADDR_LIST=""
TZ='Europe/Stockholm'

# E3 configuration
E3_REQUIRE_NAME=require
E3_REQUIRE_INC=/epics/base-7.0.6.1/require/4.0.0/include
E3_REQUIRE_VERSION=4.0.0
E3_REQUIRE_LOCATION=/epics/base-7.0.6.1/require/4.0.0
E3_REQUIRE_LIB=/epics/base-7.0.6.1/require/4.0.0/lib
E3_REQUIRE_BIN=/epics/base-7.0.6.1/require/4.0.0/bin
E3_SITEMODS_PATH=/epics/base-7.0.6.1/require/4.0.0/siteMods
E3_REQUIRE_DB=/epics/base-7.0.6.1/require/4.0.0/db
E3_REQUIRE_DBD=/epics/base-7.0.6.1/require/4.0.0/dbd
E3_IOCSH=iocsh

# Specific configuration
IOCNAME=ioc05-ami1700
PROCSERV_PORT=3005
EPICS_CAS_INTF_ADDR_LIST="192.168.10.117"
