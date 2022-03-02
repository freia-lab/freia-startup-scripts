# General configuration
EPICS_BASE=/epics/base-7.0.5
EPICS_DRIVER_PATH=/epics/base-7.0.5/require/3.4.1/siteMods:/epics/base-7.0.5/require/3.4.1/siteApps
EPICS_HOST_ARCH=linux-x86_64
#EPICS_CA_ADDR_LIST=""
TZ='Europe/Stockholm'

# E3 configuration
E3_REQUIRE_NAME=require
E3_SITELIBS_PATH=/epics/base-7.0.5/require/3.4.1/siteLibs
E3_REQUIRE_INC=/epics/base-7.0.5/require/3.4.1/include
E3_REQUIRE_VERSION=3.4.1
E3_REQUIRE_LOCATION=/epics/base-7.0.5/require/3.4.1
E3_REQUIRE_LIB=/epics/base-7.0.5/require/3.4.1/lib
E3_REQUIRE_BIN=/epics/base-7.0.5/require/3.4.1/bin
E3_SITEAPPS_PATH=/epics/base-7.0.5/require/3.4.1/siteApps
E3_SITEMODS_PATH=/epics/base-7.0.5/require/3.4.1/siteMods
E3_REQUIRE_DB=/epics/base-7.0.5/require/3.4.1/db
E3_REQUIRE_DBD=/epics/base-7.0.5/require/3.4.1/dbd

# Specific configuration
PROCSERV_PORT=3001
EPICS_CAS_INTF_ADDR_LIST="192.168.10.110"
