#!/bin/bash

runtime=420
repetition=1
perflist=(
cache-misses,instructions,branches,branch-misses,ref-cycles,cycles,faults,bus-cycles,cache-references,context-switches,cpu-clock,L1-dcache-load-misses,L1-dcache-loads
L1-dcache-stores,L1-icache-load-misses,LLC-load-misses,LLC-loads,itlb_misses.stlb_hit
LLC-store-misses,LLC-stores,branch-load-misses,branch-loads,mem-stores,dTLB-load-misses
dTLB-loads,dTLB-store-misses,dTLB-stores,iTLB-load-misses,iTLB-loads,l2_rqsts.all_demand_miss
l2_rqsts.all_demand_references,l2_rqsts.code_rd_miss,l2_rqsts.demand_data_rd_miss,l2_trans.l2_wb,l2_rqsts.miss,l2_rqsts.references,cycle_activity.cycles_mem_any
cycle_activity.stalls_mem_any,cycle_activity.stalls_total,uops_executed.stall_cycles,uops_issued.stall_cycles,uops_retired.stall_cycles,dtlb_load_misses.stlb_hit,dtlb_store_misses.stlb_hit
inst_retired.any,br_misp_retired.all_branches,br_inst_retired.all_branches,br_inst_retired.near_taken,br_inst_retired.all_branches,br_inst_retired.near_call,mem_inst_retired.all_loads,mem_inst_retired.all_stores
l1d.replacement,l2_lines_in.all,longest_lat_cache.miss,l1d_pend_miss.pending,l1d_pend_miss.pending_cycles,uops_executed.thread,uops_executed.core_cycles_ge_1,cpu_clk_unhalted.ref_tsc,msr/tsc/
)

cd benchspec/CPU
for cno in 0 1 2 3 4 5 6 7
do
	echo 'Cycle ' $cno
	for bench in 500.perlbench_r 502.gcc_r 505.mcf_r 520.omnetpp_r 523.xalancbmk_r 525.x264_r 531.deepsjeng_r 541.leela_r 548.exchange2_r 557.xz_r 507.cactuBSSN_r 508.namd_r 510.parest_r 511.povray_r 519.lbm_r 526.blender_r 538.imagick_r 544.nab_r 549.fotonik3d_r 554.roms_r 525.x264_r 511.povray_r 526.blender_r 538.imagick_r
  do
	  echo $bench
	  sudo perf stat -I 2000 -o perf.txt -r $repetition --append -x, -e ${perflist[$cno]} ./$bench/run/run_peak_refrate_perfcount-m64.0000/perfrun.sh $runtime
  done
  for bench in 503.bwaves_r 521.wrf_r 527.cam4_r
  do
	  echo $bench
    sudo perf stat -I 2000 -o perf.txt -r $repetition --append -x, -e ${perflist[$cno]} ./$bench/run/run_peak_refrate_perfcount-m64.0000/perfrun.sh $runtime
  done
done
