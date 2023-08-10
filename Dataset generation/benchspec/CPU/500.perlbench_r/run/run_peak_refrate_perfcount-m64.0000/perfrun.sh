#!/bin/bash

cd 500.perlbench_r/run/run_peak_refrate_perfcount-m64.0000
remain=$1
echo $1
end=$((`date +%s` + $remain))
while [ $remain -gt 0 ]
do
    timeout $remain ./perlbench_r -I./lib checkspam.pl 2500 5 25 11 150 1 1 1 1 > checkspam.2500.5.25.11.150.1.1.1.1.out 2>> checkspam.2500.5.25.11.150.1.1.1.1.err
    remain=$((end-`date +%s`))
    echo $remain
    if [ $remain -le 0 ]
    then break
    fi
    timeout $remain ./perlbench_r -I./lib diffmail.pl 4 800 10 17 19 300 > diffmail.4.800.10.17.19.300.out 2>> diffmail.4.800.10.17.19.300.err
    remain=$((end-`date +%s`))
    echo $remain
    if [ $remain -le 0 ]
    then break
    fi
    timeout $remain ./perlbench_r -I./lib splitmail.pl 6400 12 26 16 100 0 > splitmail.6400.12.26.16.100.0.out 2>> splitmail.6400.12.26.16.100.0.err
    remain=$((end-`date +%s`))
    echo $remain
done
cd ../../..
