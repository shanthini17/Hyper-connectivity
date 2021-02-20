# explicitly setup our main window

wm geometry  . 850x350+300+200
wm title  .   "Eifficiency improvement in 4g Data Network"

# setup the frame stuff

destroy .myArea
set f [frame .myArea -borderwidth 5 -background purple]
pack $f -side top -expand true -fill both

# create a menubar

destroy .menubar
menu .menubar
. config -menu .menubar

#  create a pull down menu with a label 

set File1 [menu .menubar.mFile1]
.menubar add cascade -label "4G Data Prediction"  -menu  .menubar.mFile1


set File2 [menu .menubar.mFile2]
.menubar add cascade -label "Cell Constrution Existing"  -menu  .menubar.mFile2

set File3 [menu .menubar.mFile3]
.menubar add cascade -label "PerformanceEvaluation"  -menu  .menubar.mFile3

set close [menu .menubar.sFile]
.menubar add cascade -label Quit  -menu  .menubar.sFile

# add the menu item

$File1 add command -label Run_Aggregated-Data -command {exec ns nrml2.tcl &}
$File1 add command -label Run_Simulation -command {exec nam unr.nam &}

$File2 add command -label Run_Aggregated-Data -command {exec ns handover.tcl &}
$File2 add command -label Run_Simulation -command {exec nam out.nam &}



$File3 add command -label "Energy" -command {exec xgraph.exe  -x "Time" -y "Databits" rpc-overhead.tr AQT_HiCuts-overhead.tr &}
$File3 add command -label "Average Hops" -command {exec xgraph.exe -x "Time" -y "Databits" rpc-fwdentriesnode.tr AQT_HiCuts-fwdentriesnode.tr  &}
$File3 add command -label "Latency" -command {exec xgraph.exe -x "Time" -y "Databits" rpc-packetdelay.tr AQT_HiCuts-packetdelay.tr &}
$File3 add command -label "Delivery Ratio" -command {exec xgraph.exe -x "Time" -y "Databits" rpc-npktsrcvd.tr AQT_HiCuts-npktsrcvd.tr  &}
$File3 add command -label "Throughput" -command {exec xgraph.exe -x "Time" -y "Databits" rpc-throughput.tr AQT_HiCuts-throughput.tr  &}
 


$close add command -label Quit -command exit
