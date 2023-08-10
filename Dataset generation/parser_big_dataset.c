#include<stdio.h>
#include<string.h>
int main() {
	FILE *fr, *fw;
	long long counter[13], v;
	char c,
	bench[][23]={
		"500.perlbench_r",
		"502.gcc_r",
		"505.mcf_r",
		"520.omnetpp_r",
		"523.xalancmbk_r",
		"525.x264_r",
		"531.deepsjeng_r",
		"541.leela_r",
		"548.exchange2_r",
		"557.xz_r",
		"507.cactuBSSN_r",
		"508.namd_r",
		"510.parest_r",
		"511.povray_r",
		"519.lbm_r",
		"526.blender_r",
		"538.imagick_r",
		"544.nab_r",
		"549.fotonik3d_r",
		"554.roms_r",
		"503.bwaves_r",
		"521.wrf_r",
		"527.cam4_r"
	};
	int i, j, k, l, numev[8]={13, 5, 6, 6, 7, 7, 8, 9};
	fr=fopen("perf.txt", "rb");
	fw=fopen("dataset_i5-11gen_74.csv", "wb");
	fprintf(fw, "workload,run-time,cache-misses,instructions,branches,branch-misses,ref-cycles,cycles,faults,bus-cycles,cache-references,context-switches,cpu-clock,L1-dcache-load-misses,L1-dcache-loads,L1-dcache-stores,L1-icache-load-misses,LLC-load-misses,LLC-loads,itlb_misses.stlb_hit,LLC-store-misses,LLC-stores,branch-load-misses,branch-loads,mem-stores,dTLB-load-misses,dTLB-loads,dTLB-store-misses,dTLB-stores,iTLB-load-misses,iTLB-loads,l2_rqsts.all_demand_miss,l2_rqsts.all_demand_references,l2_rqsts.code_rd_miss,l2_rqsts.demand_data_rd_miss,l2_trans.l2_wb,l2_rqsts.miss,l2_rqsts.references,cycle_activity.cycles_mem_any,cycle_activity.stalls_mem_any,cycle_activity.stalls_total,uops_executed.stall_cycles,uops_issued.stall_cycles,uops_retired.stall_cycles,dtlb_load_misses.stlb_hit,dtlb_store_misses.stlb_hit,inst_retired.any,br_misp_retired.all_branches,br_inst_retired.all_branches,br_inst_retired.near_taken,br_inst_retired.all_branches,br_inst_retired.near_call,mem_inst_retired.all_loads,mem_inst_retired.all_stores,l1d.replacement,l2_lines_in.all,longest_lat_cache.miss,l1d_pend_miss.pending,l1d_pend_miss.pending_cycles,uops_executed.thread,uops_executed.core_cycles_ge_1,cpu_clk_unhalted.ref_tsc,msr/tsc/,IpMispredict,BpTkBranch,IpBranch,IpCall,IpTB,IpLoad,IpStore,L1D_Cache_Fill_BW,L2_Cache_Fill_BW,L3_Cache_Fill_BW,CPI,MLP,ILP,CPU_Utilization\n");
	for(i=0; i<8; i++) {              //cycle
		for(j=0; j<23; j++) {         //benchmark
			fscanf(fr, "%*[^\n] ");
			for(l=0; l<numev[i]; l++) counter[l]=0;
			for(k=2; 1; k+=2) {       //duration
				if((c=fgetc(fr))=='#') break;
				else if(k>420) {
					fscanf(fr, "%*[^\n] ");
					continue;
				}
				else ungetc(c, fr);
				fprintf(fw, "%s,%d,", bench[j], k);
				for(l=0; l<numev[i]; l++) {
					fscanf(fr, "%*[^,],%lld%*[^\n] ", &v);
					counter[l]+=v;
					fprintf(fw, "%lld,", counter[l]);
				}
				fprintf(fw, "\n");
			}
		}
	}
	fclose(fr);
	fclose(fw);
	printf("END");
}
