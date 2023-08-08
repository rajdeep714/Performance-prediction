#!/bin/bash

cd 510.parest_r/run/run_peak_refrate_perfcount-m64.0000
remain=$1
echo $1
end=$((`date +%s` + $remain))
while [ $remain -gt 0 ]
do
    timeout $remain ./parest_r ref.prm > ref.out 2>> ref.err
    remain=$((end-`date +%s`))
    echo $remain
done
cd ../../..
