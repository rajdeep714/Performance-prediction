#!/bin/bash

cd 648.exchange2_s/run/run_peak_refspeed_perfcount-m64.0000
remain=$1
echo $1
end=$((`date +%s` + $remain))
while [ $remain -gt 0 ]
do
    timeout $remain ./exchange2_s 6 > exchange2.txt 2>> exchange2.err
    remain=$((end-`date +%s`))
    echo $remain
done
cd ../../..
