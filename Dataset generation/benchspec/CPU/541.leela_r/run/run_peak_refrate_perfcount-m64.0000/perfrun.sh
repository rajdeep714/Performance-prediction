#!/bin/bash

cd 541.leela_r/run/run_peak_refrate_perfcount-m64.0000
remain=$1
echo $1
end=$((`date +%s` + $remain))
while [ $remain -gt 0 ]
do
    timeout $remain ./leela_r ref.sgf > ref.out 2>> ref.err
    remain=$((end-`date +%s`))
    echo $remain
done
cd ../../..
