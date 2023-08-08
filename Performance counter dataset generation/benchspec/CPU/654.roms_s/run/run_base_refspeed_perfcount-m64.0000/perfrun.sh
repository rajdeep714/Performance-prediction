#!/bin/bash

cd 654.roms_s/run/run_base_refspeed_perfcount-m64.0000
remain=$1
echo $1
end=$((`date +%s` + $remain))
while [ $remain -gt 0 ]
do
    timeout $remain ./sroms < ocean_benchmark3.in > ocean_benchmark3.log 2>> ocean_benchmark3.err
    remain=$((end-`date +%s`))
    echo $remain
done
cd ../../..
