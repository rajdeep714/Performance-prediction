#!/bin/bash

cd 619.lbm_s/run/run_peak_refspeed_perfcount-m64.0000
remain=$1
echo $1
end=$((`date +%s` + $remain))
while [ $remain -gt 0 ]
do
    timeout $remain ./lbm_s 2000 reference.dat 0 0 200_200_260_ldc.of > lbm.out 2>> lbm.err
    remain=$((end-`date +%s`))
    echo $remain
done
cd ../../..
