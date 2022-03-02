require vat616
require recsync
require iocstats

epicsEnvSet ("IOCNAME", "ioc01-vat616")

iocshLoad(${vat616_DIR}/vat616_server.iocsh, "IOCNAME = ioc-vat616, IP_ADDR = 192.168.10.110")

iocshLoad(${vat616_DIR}/vat616_valve.iocsh, "PREFIX=CstatV-RHtr, V=CV580, INDX=0")
iocshLoad(${vat616_DIR}/vat616_valve.iocsh, "PREFIX=CstatV-RHtr, V=CV581, INDX=1")
iocshLoad(${vat616_DIR}/vat616_valve.iocsh, "PREFIX=CstatV-RHtr, V=CV582, INDX=2")
iocshLoad(${vat616_DIR}/vat616_valve.iocsh, "PREFIX=CstatV-RHtr, V=CV583, INDX=3")

afterInit (dbpf CstatV-RHtr:CV580:sErrCode.SCAN "1 second")
afterInit (dbpf CstatV-RHtr:CV581:sErrCode.SCAN "1 second")
afterInit (dbpf CstatV-RHtr:CV582:sErrCode.SCAN "1 second")
afterInit (dbpf CstatV-RHtr:CV583:sErrCode.SCAN "1 second")


# iocStats database

dbLoadRecords("$(iocstats_DB)/iocAdminSoft-ess.db","IOC=$(IOCNAME)")

# Start recsync client

iocshLoad("$(recsync_DIR)/recsync.iocsh", "IOCNAME=$(IOCNAME)")
