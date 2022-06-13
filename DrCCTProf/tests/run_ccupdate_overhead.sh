bench_root=/data/share/SPEC2017_BINS
input_root=/data/share/SPEC2017_INPUTS

$drrun -t ccupdate_overhead -- ${bench_root}/600.perlbench_s -I${input_root}/600.perlbench_s/data//all/input/lib ${input_root}/600.perlbench_s/data/refrate/input/checkspam.pl 2500 5 25 11 150 1 1 1 1 > 600.ccupdate.log 2>&1 &
$drrun -t ccupdate_overhead -- ${bench_root}/602.gcc_s ${input_root}/602.gcc_s/data/refspeed/input/gcc-pp.c -O5 -fipa-pta -o gcc-pp.opts-O5_-fipa-pta.s > 602.ccupdate.log 2>&1 &
$drrun -t ccupdate_overhead -- ${bench_root}/605.mcf_s ${input_root}/605.mcf_s/data/refspeed/input/inp.in > 605.ccupdate.log 2>&1 &
$drrun -t ccupdate_overhead -- ${bench_root}/607.cactuBSSN_s ${input_root}/607.cactuBSSN_s/data/refspeed/input/spec_ref.par > 607.ccupdate.log 2>&1 &
$drrun -t ccupdate_overhead -- ${bench_root}/619.lbm_s 2000 reference_refspeed00.dat 0 0 ${input_root}/619.lbm_s/data/refspeed/input/200_200_260_ldc.of > 619.ccupdate.log 2>&1 &
$drrun -t ccupdate_overhead -- ${bench_root}/620.omnetpp_s -f ${input_root}/620.omnetpp_s/data/refrate/input/omnetpp.ini -c General -r 0 > 620.ccupdate.log 2>&1 &
$drrun -t ccupdate_overhead -- ${bench_root}/623.xalancbmk_s -v ${input_root}/623.xalancbmk_s/data/refrate/input/t5.xml ${input_root}/623.xalancbmk_s/data/refrate/input/xalanc.xsl > 623.ccupdate.log 2>&1 &
$drrun -t ccupdate_overhead -- ${bench_root}/625.x264_s --seek 500 --dumpyuv 200 --frames 1250 -o BuckBunny_New_refspeed3.264 ${input_root}/625.x264_s/data/refrate/input/BuckBunny.yuv 1280x720 > 625.ccupdate.log 2>&1 &
$drrun -t ccupdate_overhead -- ${bench_root}/631.deepsjeng_s ${input_root}/631.deepsjeng_s/data/refspeed/input/ref.txt > 631.ccupdate.log 2>&1 &
$drrun -t ccupdate_overhead -- ${bench_root}/638.imagick_s -limit disk 0 ${input_root}/638.imagick_s/data/refspeed/input/refspeed_input.tga -resize 817%% -rotate -2.76 -shave 540x375 -alpha remove -auto-level -contrast-stretch 1x1%% -colorspace Lab -channel R -equalize +channel -colorspace sRGB -define histogram:unique-colors=false -adaptive-blur 0x5 -despeckle -auto-gamma -adaptive-sharpen 55 -enhance -brightness-contrast 10x10 -resize 30%% refspeed_output.tga > 638.ccupdate.log 2>&1 &
$drrun -t ccupdate_overhead -- ${bench_root}/641.leela_s ${input_root}/641.leela_s/data/refrate/input/ref.sgf > 641.ccupdate.log 2>&1 &
$drrun -t ccupdate_overhead -- ${bench_root}/644.nab_s /data/share/whistle/cpu2017_run/644.nab_s/3j1n 20140317 220 > 644.ccupdate.log 2>&1 &
$drrun -t ccupdate_overhead -- ${bench_root}/657.xz_s ${input_root}/657.xz_s/data/all/input/cld.tar.xz 1400 19cf30ae51eddcbefda78dd06014b4b96281456e078ca7c13e1c0c9e6aaea8dff3efb4ad6b0456697718cede6bd5454852652806a657bb56e07d61128434b474 536995164 539938872 > 657.ccupdate.log 2>&1 &

