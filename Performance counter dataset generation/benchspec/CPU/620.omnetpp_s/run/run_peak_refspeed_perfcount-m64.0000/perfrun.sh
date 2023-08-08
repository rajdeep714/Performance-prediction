#!/bin/bash

cd 620.omnetpp_s/run/run_peak_refspeed_perfcount-m64.0000
remain=$1
echo $1
end=$((`date +%s` + $remain))
while [ $remain -gt 0 ]
do
    timeout $remain ./omnetpp_s -c General -r 0 > omnetpp.General-0.out 2>> omnetpp.General-0.err
    remain=$((end-`date +%s`))
    echo $remain
done
cd ../../..
