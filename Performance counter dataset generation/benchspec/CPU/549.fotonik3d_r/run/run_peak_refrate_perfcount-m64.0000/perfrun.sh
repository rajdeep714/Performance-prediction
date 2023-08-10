#!/bin/bash

cd 549.fotonik3d_r/run/run_peak_refrate_perfcount-m64.0000
remain=$1
echo $1
end=$((`date +%s` + $remain))
while [ $remain -gt 0 ]
do
    timeout $remain ./fotonik3d_r > fotonik3d_r.log 2>> fotonik3d_r.err
    remain=$((end-`date +%s`))
done
cd ../../..
