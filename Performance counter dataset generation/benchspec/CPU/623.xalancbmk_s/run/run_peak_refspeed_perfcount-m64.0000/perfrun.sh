#!/bin/bash

cd 623.xalancbmk_s/run/run_peak_refspeed_perfcount-m64.0000
remain=$1
echo $1
end=$((`date +%s` + $remain))
while [ $remain -gt 0 ]
do
    timeout $remain ./xalancbmk_s -v t5.xml xalanc.xsl > ref-t5.out 2>> ref-t5.err
    remain=$((end-`date +%s`))
    echo $remain
done
cd ../../..
