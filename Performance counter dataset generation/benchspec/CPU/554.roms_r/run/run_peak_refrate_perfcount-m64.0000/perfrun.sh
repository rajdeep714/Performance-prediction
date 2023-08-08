#!/bin/bash

cd 554.roms_r/run/run_peak_refrate_perfcount-m64.0000
remain=$1
echo $1
end=$((`date +%s` + $remain))
while [ $remain -gt 0 ]
do
    timeout $remain ./roms_r < ocean_benchmark2.in.x > ocean_benchmark2.log 2>> ocean_benchmark2.err
    remain=$((end-`date +%s`))
    echo $remain
done
cd ../../..
