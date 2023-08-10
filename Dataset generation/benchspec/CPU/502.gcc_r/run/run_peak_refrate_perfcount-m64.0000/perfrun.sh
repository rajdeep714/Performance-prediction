#!/bin/bash

cd 502.gcc_r/run/run_peak_refrate_perfcount-m64.0000
remain=$1
echo $1
end=$((`date +%s` + $remain))
while [ $remain -gt 0 ]
do
    timeout $remain ./cpugcc_r gcc-pp.c -O3 -finline-limit=0 -fif-conversion -fif-conversion2 -o gcc-pp.opts-O3_-finline-limit_0_-fif-conversion_-fif-conversion2.s > gcc-pp.opts-O3_-finline-limit_0_-fif-conversion_-fif-conversion2.out 2>> gcc-pp.opts-O3_-finline-limit_0_-fif-conversion_-fif-conversion2.err
    remain=$((end-`date +%s`))
    echo $remain
    if [ $remain -le 0 ]
    then break
    fi
    timeout $remain ./cpugcc_r gcc-pp.c -O2 -finline-limit=36000 -fpic -o gcc-pp.opts-O2_-finline-limit_36000_-fpic.s > gcc-pp.opts-O2_-finline-limit_36000_-fpic.out 2>> gcc-pp.opts-O2_-finline-limit_36000_-fpic.err
    remain=$((end-`date +%s`))
    echo $remain
    if [ $remain -le 0 ]
    then break
    fi
    timeout $remain ./cpugcc_r gcc-smaller.c -O3 -fipa-pta -o gcc-smaller.opts-O3_-fipa-pta.s > gcc-smaller.opts-O3_-fipa-pta.out 2>> gcc-smaller.opts-O3_-fipa-pta.err
    remain=$((end-`date +%s`))
    echo $remain
    if [ $remain -le 0 ]
    then break
    fi
    timeout $remain ./cpugcc_r ref32.c -O5 -o ref32.opts-O5.s > ref32.opts-O5.out 2>> ref32.opts-O5.err
    remain=$((end-`date +%s`))
    echo $remain
    if [ $remain -le 0 ]
    then break
    fi
    timeout $remain ./cpugcc_r ref32.c -O3 -fselective-scheduling -fselective-scheduling2 -o ref32.opts-O3_-fselective-scheduling_-fselective-scheduling2.s > ref32.opts-O3_-fselective-scheduling_-fselective-scheduling2.out 2>> ref32.opts-O3_-fselective-scheduling_-fselective-scheduling2.err
    remain=$((end-`date +%s`))
    echo $remain
done
cd ../../..
