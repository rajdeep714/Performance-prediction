#!/bin/bash

cd 621.wrf_s/run/run_base_refspeed_perfcount-m64.0000
remain=$1
echo $1
end=$((`date +%s` + $remain))
while [ $remain -gt 0 ]
do
    timeout $remain ./wrf_s > rsl.out.0000 2>> wrf.err
    remain=$((end-`date +%s`))
    echo $remain
done
cd ../../..
