#require ioc-sis8300llrf-freia,konrad
#requireSnippet(sis8300llrf-freia.cmd, "SIS8300LLRF_SLOT=4")
# Tested calibration procedure on Jan, 29th (ok)
#require sis8300llrf,2.18.7
#requireSnippet(sis8300llrf-demo.cmd, "SIS8300LLRF_SLOT=4")

# Worked ok up till 25-Feb
#require sis8300llrf-demo,1.0.0
#requireSnippet(sis8300llrf-demo-start.cmd, "SIS8300LLRF_SLOT=4")

#Worked ok on 26-Feb
#require ioc-sis8300llrf-freia,0.1.1
#requireSnippet(sis8300llrf-demo-start.cmd, "SIS8300LLRF_SLOT=4")

#require sis8300llrf,3.2.0
require sis8300llrf
#require ioc-sis8300llrf-freia,konrad
require ioc-sis8300llrf-freia
requireSnippet(sis8300llrf-freia.cmd, "SIS8300LLRF_SLOT=4")
