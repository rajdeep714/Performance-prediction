#!/bin/bash

cd 519.lbm_r/run/run_peak_refrate_perfcount-m64.0000
remain=$1
echo $1
end=$((`date +%s` + $remain))
while [ $remain -gt 0 ]
do
    timeout $remain ./lbm_r 3000 reference.dat 0 0 100_100_130_ldc.of > lbm.out 2>> lbm.err
    remain=$((end-`date +%s`))
    echo $remain
done
cd ../../..
