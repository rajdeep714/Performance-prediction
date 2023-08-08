#!/bin/bash

cd 631.deepsjeng_s/run/run_peak_refspeed_perfcount-m64.0000
remain=$1
echo $1
end=$((`date +%s` + $remain))
while [ $remain -gt 0 ]
do
    timeout $remain ./deepsjeng_s ref.txt > ref.out 2>> ref.err
    remain=$((end-`date +%s`))
    echo $remain
done
cd ../../..
