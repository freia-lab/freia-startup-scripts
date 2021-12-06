require hevol,0.4.0
require recsync

epicsEnvSet ("IOCNAME", "ioc18-hevol")

iocshLoad("$(hevol_DIR)/hevol.iocsh", "TOP=/opt/epics/autosave")
iocshLoad("$(recsync_DIR)/recsync.iocsh", "IOCNAME=$(IOCNAME)")

