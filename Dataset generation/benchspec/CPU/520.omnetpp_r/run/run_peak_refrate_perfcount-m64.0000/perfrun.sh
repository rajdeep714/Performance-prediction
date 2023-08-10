#!/bin/bash

cd 520.omnetpp_r/run/run_peak_refrate_perfcount-m64.0000
remain=$1
echo $1
end=$((`date +%s` + $remain))
while [ $remain -gt 0 ]
do
    timeout $remain ./omnetpp_r -c General -r 0 > omnetpp.General-0.out 2>> omnetpp.General-0.err
    remain=$((end-`date +%s`))
    echo $remain
done
cd ../../..
