#!/bin/bash

cd 649.fotonik3d_s/run/run_peak_refspeed_perfcount-m64.0000
remain=$1
echo $1
end=$((`date +%s` + $remain))
while [ $remain -gt 0 ]
do
    timeout $remain ./fotonik3d_s > fotonik3d_s.log 2>> fotonik3d_s.err
    remain=$((end-`date +%s`))
done
cd ../../..
