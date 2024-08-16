# General configuration
EPICS_BASE=/epics/base-7.0.7
EPICS_DRIVER_PATH=/epics/base-7.0.7/require/5.0.0/siteMods
EPICS_HOST_ARCH=linux-x86_64
#EPICS_CA_ADDR_LIST=""
TZ='Europe/Stockholm'
EPICS_TZ='Europe/Stockholm'
LOCATION=30007

# E3 configuration
E3_REQUIRE_NAME=require
E3_REQUIRE_INC=/epics/base-7.0.7/require/5.0.0/include
E3_REQUIRE_VERSION=5.0.0
E3_REQUIRE_LOCATION=/epics/base-7.0.7/require/5.0.0
E3_REQUIRE_LIB=/epics/base-7.0.7/require/5.0.0/lib
E3_REQUIRE_BIN=/epics/base-7.0.7/require/5.0.0/bin
E3_SITEMODS_PATH=/epics/base-7.0.7/require/5.0.0/siteMods
E3_REQUIRE_DB=/epics/base-7.0.7/require/5.0.0/db
E3_REQUIRE_DBD=/epics/base-7.0.7/require/5.0.0/dbd
E3_IOCSH=iocsh

# Specific configuration
IOCNAME=ioc11-gersemi
PROCSERV_PORT=3011
EPICS_CAS_INTF_ADDR_LIST="192.168.10.115"
CS_CA_MAX_ARRAY_BYTES=1000000

