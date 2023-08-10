#!/bin/bash

cd 548.exchange2_r/run/run_peak_refrate_perfcount-m64.0000
remain=$1
echo $1
end=$((`date +%s` + $remain))
while [ $remain -gt 0 ]
do
    timeout $remain ./exchange2_r 6 > exchange2.txt 2>> exchange2.err
    remain=$((end-`date +%s`))
    echo $remain
done
cd ../../..
