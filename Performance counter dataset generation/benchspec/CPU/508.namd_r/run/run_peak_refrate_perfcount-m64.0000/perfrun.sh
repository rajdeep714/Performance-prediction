#!/bin/bash

cd 508.namd_r/run/run_peak_refrate_perfcount-m64.0000
remain=$1
echo $1
end=$((`date +%s` + $remain))
while [ $remain -gt 0 ]
do
    timeout $remain ./namd_r --input apoa1.input --output apoa1.ref.output --iterations 65 > namd.out 2>> namd.err
    remain=$((end-`date +%s`))
    echo $remain
done
cd ../../..
