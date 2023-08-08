#!/bin/bash

cd 523.xalancbmk_r/run/run_peak_refrate_perfcount-m64.0000
remain=$1
echo $1
end=$((`date +%s` + $remain))
while [ $remain -gt 0 ]
do
    timeout $remain ./cpuxalan_r -v t5.xml xalanc.xsl > ref-t5.out 2>> ref-t5.err
    remain=$((end-`date +%s`))
    echo $remain
done
cd ../../..
