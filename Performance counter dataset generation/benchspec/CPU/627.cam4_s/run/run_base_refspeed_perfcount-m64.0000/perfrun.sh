#!/bin/bash

cd 627.cam4_s/run/run_base_refspeed_perfcount-m64.0000
remain=$1
echo $1
end=$((`date +%s` + $remain))
while [ $remain -gt 0 ]
do
    timeout $remain ./cam4_s > cam4_s_base.perfcount-m64.txt 2>> cam4_s_base.perfcount-m64.err
	remain=$((end-`date +%s`))
    echo $remain
done
cd ../../..
