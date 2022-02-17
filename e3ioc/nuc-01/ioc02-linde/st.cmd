require linde
require recsync
require iocstats

epicsEnvSet ("IOCNAME", "ioc02-linde")

iocshLoad("$(linde_DIR)/linde.iocsh", "PLC_IP=192.168.1.10")

# iocStats database

dbLoadRecords("$(iocstats_DB)/iocAdminSoft-ess.db","IOC=$(IOCNAME)")

# Start recsync client

iocshLoad("$(recsync_DIR)/recsync.iocsh", "IOCNAME=$(IOCNAME)")

# Dewar level
afterInit("dbpf", "Cryo-Dwr:LHe:LI5200_Lt.LOLO", "200.")
afterInit("dbpf", "Cryo-Dwr:LHe:LI5200_Lt.LLSV", "MAJOR")
afterInit("dbpf", "Cryo-Dwr:LHe:LI5200_Lt.HYST", "5")

# Buffertank
afterInit("dbpf", "Cryo-Cmp:HP:PI2170.LLSV", "MAJOR")
afterInit("dbpf", "Cryo-Cmp:HP:PI2170.LOLO", "4.5")
afterInit("dbpf", "Cryo-Cmp:HP:PI2170.LSV", "MINOR")
afterInit("dbpf", "Cryo-Cmp:HP:PI2170.LOW", "5.0")
afterInit("dbpf", "Cryo-Cmp:HP:PI2170.HYST", "0.3")

# LN2 nytt
afterInit("dbpf", "Cryo-CBox:LN2:LI3685-PercOut.LOW", "50")
afterInit("dbpf", "Cryo-CBox:LN2:LI3685-PercOut.LOLO", "20")
afterInit("dbpf", "Cryo-CBox:LN2:LI3685-PercOut.LSV", "MINOR")
afterInit("dbpf", "Cryo-CBox:LN2:LI3685-PercOut.LLSV", "MAJOR")
afterInit("dbpf", "Cryo-CBox:LN2:LI3685-PercOut.HYST", "2")

