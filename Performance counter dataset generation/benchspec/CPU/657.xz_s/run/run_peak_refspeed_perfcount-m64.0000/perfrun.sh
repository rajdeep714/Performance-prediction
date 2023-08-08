#!/bin/bash

cd 657.xz_s/run/run_peak_refspeed_perfcount-m64.0000
remain=$1
echo $1
end=$((`date +%s` + $remain))
while [ $remain -gt 0 ]
do
    timeout $remain ./xz_s cpu2006docs.tar.xz 6643 055ce243071129412e9dd0b3b69a21654033a9b723d874b2015c774fac1553d9713be561ca86f74e4f16f22e664fc17a79f30caa5ad2c04fbc447549c2810fae 1036078272 1111795472 4 > cpu2006docs.tar-6643-4.out 2>> cpu2006docs.tar-6643-4.err
    remain=$((end-`date +%s`))
    echo $remain
    if [ $remain -le 0 ]
    then break
    fi
    timeout $remain ./xz_s cld.tar.xz 1400 19cf30ae51eddcbefda78dd06014b4b96281456e078ca7c13e1c0c9e6aaea8dff3efb4ad6b0456697718cede6bd5454852652806a657bb56e07d61128434b474 536995164 539938872 8 > cld.tar-1400-8.out 2>> cld.tar-1400-8.err
    remain=$((end-`date +%s`))
    echo $remain
done
cd ../../..
