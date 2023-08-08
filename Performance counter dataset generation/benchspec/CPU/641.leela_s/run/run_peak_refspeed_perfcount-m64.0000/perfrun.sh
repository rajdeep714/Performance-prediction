#!/bin/bash

cd 641.leela_s/run/run_peak_refspeed_perfcount-m64.0000
remain=$1
echo $1
end=$((`date +%s` + $remain))
while [ $remain -gt 0 ]
do
    timeout $remain ./leela_s ref.sgf > ref.out 2>> ref.err
    remain=$((end-`date +%s`))
    echo $remain
done
cd ../../..
