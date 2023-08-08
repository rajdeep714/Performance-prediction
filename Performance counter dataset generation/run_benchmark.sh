#!/bin/bash

runtime=420
repetition=3
cd benchspec/CPU
for bench in 500.perlbench_r 502.gcc_r 505.mcf_r 520.omnetpp_r 523.xalancbmk_r 525.x264_r 531.deepsjeng_r 541.leela_r 548.exchange2_r 557.xz_r 507.cactuBSSN_r 508.namd_r 510.parest_r 511.povray_r 519.lbm_r 526.blender_r 538.imagick_r 544.nab_r 549.fotonik3d_r 554.roms_r 525.x264_r 511.povray_r 526.blender_r 538.imagick_r
do
	echo $bench
	sudo perf stat -I 2000 -o perf.txt -r $repetition -x, -e cycles,cache-misses,instructions,cycle_activity.stalls_total,branch-misses,context-switches,iTLB-load-misses ./$bench/run/run_peak_refrate_perfcount-m64.0000/perfrun.sh $runtime
done

for bench in 503.bwaves_r 521.wrf_r 527.cam4_r
do
	echo $bench
	sudo perf stat -I 2000 -o perf.txt -r $repetition -x, -e cycles,cache-misses,instructions,cycle_activity.stalls_total,branch-misses,context-switches,iTLB-load-misses ./$bench/run/run_base_refrate_perfcount-m64.0000/perfrun.sh $runtime
done
