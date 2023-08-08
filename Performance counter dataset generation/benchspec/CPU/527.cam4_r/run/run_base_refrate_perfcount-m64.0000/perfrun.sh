#!/bin/bash

cd 527.cam4_r/run/run_base_refrate_perfcount-m64.0000
remain=$1
echo $1
end=$((`date +%s` + $remain))
while [ $remain -gt 0 ]
do
    timeout $remain ./cam4_r > cam4_r.txt 2>> cam4_r.err
	remain=$((end-`date +%s`))
    echo $remain
done
cd ../../..
