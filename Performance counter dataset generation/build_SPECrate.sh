#!/bin/bash

cd benchspec/CPU
execlist=(perlbench_r cpugcc_r mcf_r omnetpp_r cpuxalan_r deepsjeng_r leela_r exchange2_r xz_r cactuBSSN_r namd_r parest_r lbm_r nab_r fotonik3d_r roms_r)
i=0
for bench in 500.perlbench_r 502.gcc_r 505.mcf_r 520.omnetpp_r 523.xalancbmk_r 531.deepsjeng_r 541.leela_r 548.exchange2_r 557.xz_r 507.cactusBSSN_r 508.namd_r 510.parest_r 519.lbm_r 544.nab_r 549.fotonik3d_r 554.roms_r
do
    cd $bench/build/build_peak_perfcount-m64.0000
    specmake clean
    specmake
    cd ../../run/run_peak_refrate_perfcount-m64.0000/
    cp ../../build/build_peak_perfcount-m64.0000/${execlist[$i]} .
    i=`expr $i + 1`
    cd ../../..
done

execlist=(x264_r povray_r blender_r imagick_r)
i=0
for bench in 525.x264_r 511.povray_r 526.blender_r 538.imagick_r
do
    cd $bench/build/build_peak_perfcount-m64.0000
    specmake clean TARGET=${execlist[$i]}
    specmake TARGET=${execlist[$i]}
    cd ../../run/run_peak_refrate_perfcount-m64.0000/
    cp ../../build/build_peak_perfcount-m64.0000/${execlist[$i]} .
    i=`expr $i + 1`
    cd ../../..
done

cd 503.bwaves_r/build/build_base_perfcount-m64.0000
specmake clean
specmake
cd ../../run/run_base_refrate_perfcount-m64.0000/
cp ../../build/build_base_perfcount-m64.0000/bwaves_r .
cd ../../..

execlist=(wrf_r cam4_r)
i=0
for bench in 521.wrf_r 527.cam4_r
do
    cd $bench/build/build_base_perfcount-m64.0000
    specmake clean TARGET=${execlist[$i]}
    specmake TARGET=${execlist[$i]}
    cd ../../run/run_base_refrate_perfcount-m64.0000/
    cp ../../build/build_base_perfcount-m64.0000/${execlist[$i]} .
    i=`expr $i + 1`
    cd ../../..
done
