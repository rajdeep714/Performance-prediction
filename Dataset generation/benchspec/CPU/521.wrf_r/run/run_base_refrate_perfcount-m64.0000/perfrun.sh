#!/bin/bash

cd 521.wrf_r/run/run_base_refrate_perfcount-m64.0000
remain=$1
echo $1
end=$((`date +%s` + $remain))
while [ $remain -gt 0 ]
do
    timeout $remain ./wrf_r > rsl.out.0000 2>> wrf.err
    remain=$((end-`date +%s`))
    echo $remain
done
cd ../../..
