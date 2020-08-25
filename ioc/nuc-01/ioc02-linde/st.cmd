#require ioc-linde-freia,konrad
require ioc-linde-freia,1.3+
requireSnippet(linde-freia.cmd, "PLC_IPADDR=192.168.1.10")

# Dewar level
dbpf Cryo-Dwr:LHe:LI5200_Lt.LOLO 200.
dbpf Cryo-Dwr:LHe:LI5200_Lt.LLSV "MAJOR"
dbpf Cryo-Dwr:LHe:LI5200_Lt.HYST 5

# Buffertank
dbpf Cryo-Cmp:HP:PI2170.LLSV "MAJOR"
dbpf Cryo-Cmp:HP:PI2170.LOLO 4.5
dbpf Cryo-Cmp:HP:PI2170.LSV "MINOR"
dbpf Cryo-Cmp:HP:PI2170.LOW 5.0
dbpf Cryo-Cmp:HP:PI2170.HYST 0.3

# LN2 nytt
dbpf Cryo-CBox:LN2:LI3685-PercOut.LOW 50
dbpf Cryo-CBox:LN2:LI3685-PercOut.LOLO 20
dbpf Cryo-CBox:LN2:LI3685-PercOut.LSV "MINOR"
dbpf Cryo-CBox:LN2:LI3685-PercOut.LLSV "MAJOR"
dbpf Cryo-CBox:LN2:LI3685-PercOut.HYST 2
