#!/bin/bash

cd 607.cactuBSSN_s/run/run_peak_refspeed_perfcount-m64.0000
remain=$1
echo $1
end=$((`date +%s` + $remain))
while [ $remain -gt 0 ]
do
    timeout $remain ./cactuBSSN_s spec_ref.par   > spec_ref.out 2>> spec_ref.err
    remain=$((end-`date +%s`))
    echo $remain
done
cd ../../..
