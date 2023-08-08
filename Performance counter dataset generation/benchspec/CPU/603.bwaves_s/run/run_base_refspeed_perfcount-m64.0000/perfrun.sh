#!/bin/bash

cd 603.bwaves_s/run/run_base_refspeed_perfcount-m64.0000
remain=$1
echo $1
end=$((`date +%s` + $remain))
while [ $remain -gt 0 ]
do
    timeout $remain ./speed_bwaves bwaves_1 < bwaves_1.in > bwaves_1.out 2>> bwaves_1.err
    remain=$((end-`date +%s`))
    echo $remain
    if [ $remain -le 0 ]
    then break
    fi
    timeout $remain ./speed_bwaves bwaves_2 < bwaves_2.in > bwaves_2.out 2>> bwaves_2.err
    remain=$((end-`date +%s`))
    echo $remain
done
cd ../../..
