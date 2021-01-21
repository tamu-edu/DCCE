BENCH_NAMES := 	600.perlbench_s \
								602.gcc_s 			\
								605.mcf_s 			\
								620.omnetpp_s 	\
								623.xalancbmk_s \
								625.x264_s 			\
								631.deepsjeng_s \
								641.leela_s 		\
								648.exchange2_s \
								657.xz_s 				\
								998.specrand_is

DIR_BC 			:= $(DCCE_ROOT)/cpu2017/dcce/bitcode
DIR_DOT 		:= $(DCCE_ROOT)/cpu2017/dcce/dots

BITCODE_FILES	:= $(addprefix $(DIR_BC)/, $(addsuffix .bc, $(BENCH_NAMES)))


.PHONY: clean
clean:
	rm $(DIR_DOT)/*
