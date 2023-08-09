#include<stdio.h>
#include<string.h>
int main() {
	FILE *fr, *fw;
	long long counter[8], v, cycles;
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
		"554.roms_r"
		"503.bwaves_r",
		"521.wrf_r",
		"527.cam4_r",
	};
	int i, j, k;
	fr=fopen("perf_counter.txt", "rb");
	fw=fopen("dataset_counters.csv", "wb");
	fprintf(fw, "workload,cycles,cache-misses,instructions,cycle_activity.stalls_total,branch-misses,context-switches,iTLB-load-misses\n");
	for(i=0; i<23; i++) {         //benchmark
		fscanf(fr, "%*[^\n] ");
		for(j=0; j<6; j++) counter[j]=0;
		cycles=0;
		for(j=2; 1; j+=2) {       //duration
			if((c=fgetc(fr))=='#') break;
			else if(j>420) {
				fscanf(fr, "%*[^\n] ");
				continue;
			}
			else ungetc(c, fr);
			fscanf(fr, "%*[^,],%lld%*[^\n] ", &v);
			cycles+=v;
			fprintf(fw, "%s,%lld", bench[i], cycles);
			for(k=0; k<6; k++) {
        fscanf(fr, "%*[^,],%lld%*[^\n] ", &v);
			  counter[0]+=v;
        fprintf(fw, ",%lld", counter[k]);
      }
			fprintf(fw, "\n");
		}
	}
	fclose(fr);
	fclose(fw);
	printf("Counter dataset parsed");

	fr=fopen("perf_metric.txt", "rb");
  fw=fopen("dataset_metrics.csv", "wb");
	fprintf(fw, "workload,cycles,IpCall,IpLoad,IpMispredict,BpTkBranch,MLP\n");
	for(i=0; i<23; i++) {         //benchmark
		fscanf(fr, "%*[^\n] ");
		for(j=0; j<8; j++) counter[j]=0;
		cycles=0;
		for(j=2; 1; j+=2) {       //duration
			if((c=fgetc(fr))=='#') break;
			else if(j>420) {
				fscanf(fr, "%*[^\n] ");
				continue;
			}
			else ungetc(c, fr);
			fscanf(fr, "%*[^,],%lld%*[^\n] ", &v);
			cycles+=v;
			fprintf(fw, "%s,%lld", bench[i], cycles);
      for(k=0; k<8; k++) {
	  		fscanf(fr, "%*[^,],%lf%*[^\n] ", &v);
  			counter[0]+=v;
      }
			fprintf(fw, ",%.2lf", counter[0]/counter[1]);
			fprintf(fw, ",%.2lf", counter[0]/counter[2]);
			fprintf(fw, ",%.2lf", counter[0]/counter[3]);
			fprintf(fw, ",%.2lf", counter[5]/counter[4]);
			fprintf(fw, ",%.2lf", counter[7]/counter[6]);
			fprintf(fw, "\n");
		}
	}
	fclose(fr);
	fclose(fw);
	printf("Metric dataset parsed");
}
