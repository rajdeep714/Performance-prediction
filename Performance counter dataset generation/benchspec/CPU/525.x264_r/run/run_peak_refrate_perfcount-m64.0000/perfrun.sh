#!/bin/bash

cd 525.x264_r/run/run_peak_refrate_perfcount-m64.0000
remain=$1
echo $1
end=$((`date +%s` + $remain))
while [ $remain -gt 0 ]
do
    timeout $remain ./x264_r --pass 1 --stats x264_stats.log --bitrate 1000 --frames 1000 -o BuckBunny_New.264 BuckBunny.yuv 1280x720 > run_000-1000_x264_r_x264_pass1.out 2>> run_000-1000_x264_r_x264_pass1.err
    remain=$((end-`date +%s`))
    if [ $remain -le 0 ]
    then break
    fi
    timeout $remain ./x264_r --pass 2 --stats x264_stats.log --bitrate 1000 --dumpyuv 200 --frames 1000 -o BuckBunny_New.264 BuckBunny.yuv 1280x720 > run_000-1000_x264_r_x264_pass2.out 2>> run_000-1000_x264_r_x264_pass2.err
    remain=$((end-`date +%s`))
    if [ $remain -le 0 ]
    then break
    fi
    timeout $remain ./x264_r --seek 500 --dumpyuv 200 --frames 1250 -o BuckBunny_New.264 BuckBunny.yuv 1280x720 > run_0500-1250_x264_r_x264.out 2>> run_0500-1250_x264_r_x264.err
    remain=$((end-`date +%s`))
done
cd ../../..
