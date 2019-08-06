#require autosave,5.7+
#require simple-pid-freia,konrad
require simple-pid-freia,0.1+
#epicsEnvSet("AUTOSAVE_SYSM_PV_PREFIX","simple-pid:")


## Load record instances
dbLoadRecords("simple-pid-freia.db", "P_MEAS='CstatH-LHe:PT102:sRdV',P_OUT='CstatH-MKS:MKS3:cOutput',SCAN='5 second'")

#requireSnippet(rfleakdet-freia-preSaveRestore.cmd)

iocInit

#requireSnippet(rfleakdet-freia-postSaveRestore.cmd)
