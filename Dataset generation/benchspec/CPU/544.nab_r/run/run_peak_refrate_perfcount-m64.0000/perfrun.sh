#!/bin/bash

cd 544.nab_r/run/run_peak_refrate_perfcount-m64.0000
remain=$1
echo $1
end=$((`date +%s` + $remain))
while [ $remain -gt 0 ]
do
    timeout $remain ./nab_r 1am0 1122214447 122 > 1am0.out 2>> 1am0.err
    remain=$((end-`date +%s`))
    echo $remain
done
cd ../../..
