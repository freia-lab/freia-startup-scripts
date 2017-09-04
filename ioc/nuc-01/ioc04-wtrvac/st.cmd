#require ioc_wtrvac_freia,konrad
require ioc_wtrvac_freia,1.11+
requireSnippet(wtrvac-freia.cmd, "PLC_IPADDR=192.168.10.10")
dbpf WtrC-Dwtr:Kly-FT01:sRdV.DESC "Cooling water flow: collector + RF"
dbpf WtrC-Dwtr:Kly-FT02:sRdV.DESC "Cooling water flow: oil tank + window"
dbpf WtrC-Dwtr:Kly-FT03:sRdV.DESC "Cooling water flow: klystron body"
dbpf WtrC-Dwtr:Kly-FT04:sRdV.DESC "Cooling water flow: coil"
