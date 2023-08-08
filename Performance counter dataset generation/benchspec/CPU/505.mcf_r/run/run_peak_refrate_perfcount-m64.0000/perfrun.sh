#!/bin/bash

cd 505.mcf_r/run/run_peak_refrate_perfcount-m64.0000
remain=$1
echo $1
end=$((`date +%s` + $remain))
while [ $remain -gt 0 ]
do
    timeout $remain ./mcf_r inp.in  > inp.out 2>> inp.err
    remain=$((end-`date +%s`))
    echo $remain
done
cd ../../..
