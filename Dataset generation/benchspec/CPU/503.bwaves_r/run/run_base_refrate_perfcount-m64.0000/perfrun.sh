#!/bin/bash

cd 503.bwaves_r/run/run_base_refrate_perfcount-m64.0000
remain=$1
echo $1
end=$((`date +%s` + $remain))
while [ $remain -gt 0 ]
do
    timeout $remain ./bwaves_r bwaves_1 < bwaves_1.in > bwaves_1.out 2>> bwaves_1.err
    remain=$((end-`date +%s`))
    echo $remain
    if [ $remain -le 0 ]
    then break
    fi
    timeout $remain ./bwaves_r bwaves_2 < bwaves_2.in > bwaves_2.out 2>> bwaves_2.err
    remain=$((end-`date +%s`))
    echo $remain
    if [ $remain -le 0 ]
    then break
    fi
    timeout $remain ./bwaves_r bwaves_3 < bwaves_3.in > bwaves_3.out 2>> bwaves_3.err
    remain=$((end-`date +%s`))
    echo $remain
    if [ $remain -le 0 ]
    then break
    fi
    timeout $remain ./bwaves_r bwaves_4 < bwaves_4.in > bwaves_4.out 2>> bwaves_4.err
    remain=$((end-`date +%s`))
    echo $remain
done
cd ../../..
