#require autosave,5.7+
#require ioc_cm_freia,konrad
require ioc_cm_freia,0.21+

requireSnippet(cm-freia.cmd, "PLC_IPADDR=192.168.1.11, KEITH_IPADDR=192.168.1.12:5025")

dbpf CM-VBox:LT03:sRdV.LOLO 2
dbpf CM-CM:LT01:sRdV.LOLO 2
dbpf CM-VBox:LT03:sRdV.HYST 3
dbpf CM-CM:LT01:sRdV.HYST 3
dbpf CM-CM:LT01:sRdV.LLSV MAJOR
dbpf CM-VBox:LT03:sRdV.LLSV MAJOR

