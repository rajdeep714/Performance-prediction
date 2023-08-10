#!/bin/bash

cd 538.imagick_r/run/run_peak_refrate_perfcount-m64.0000
remain=$1
echo $1
end=$((`date +%s` + $remain))
while [ $remain -gt 0 ]
do
    timeout $remain ./imagick_r -limit disk 0 refrate_input.tga -edge 41 -resample 181% -emboss 31 -colorspace YUV -mean-shift 19x19+15% -resize 30% time refrate_output.tga > refrate_convert.out 2>> refrate_convert.err
    remain=$((end-`date +%s`))
    echo $remain
done
cd ../../..
