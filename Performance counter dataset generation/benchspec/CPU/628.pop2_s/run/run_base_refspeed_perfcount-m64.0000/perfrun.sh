#!/bin/bash

cd 628.pop2_s/run/run_base_refspeed_perfcount-m64.0000
remain=$1
echo $1
end=$((`date +%s` + $remain))
while [ $remain -gt 0 ]
do
    timeout $remain ./speed_pop2 > pop2_s.out 2>> pop2_s.err
	remain=$((end-`date +%s`))
    echo $remain
done
cd ../../..
