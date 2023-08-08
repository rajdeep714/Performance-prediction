#!/bin/bash

cd 644.nab_s/run/run_peak_refspeed_perfcount-m64.0000
remain=$1
echo $1
end=$((`date +%s` + $remain))
while [ $remain -gt 0 ]
do
    timeout $remain ./nab_s 3j1n 20140317 220 > 3j1n.out 2>> 3j1n.err
    remain=$((end-`date +%s`))
    echo $remain
done
cd ../../..
