#!/bin/bash

cd 507.cactuBSSN_r/run/run_peak_refrate_perfcount-m64.0000
remain=$1
echo $1
end=$((`date +%s` + $remain))
while [ $remain -gt 0 ]
do
    timeout $remain ./cactusBSSN_r spec_ref.par   > spec_ref.out 2>> spec_ref.err
    remain=$((end-`date +%s`))
    echo $remain
done
cd ../../..
