TARGET = $(OUTPUT_BIN)/Splash-3/708.OCEAN-NCP
OBJS = jacobcalc.o laplacalc.o main.o multi.o slave1.o slave2.o sk_barrier.o

include ../../../Makefile.config

decs.h: decs.h.in
jacobcalc.c: decs.h
main.c: decs.h
slave1.c: decs.h
laplacalc.c: decs.h
multi.c : decs.h
slave2.c: decs.h
sk_barrier.o: sk_barrier.c.in sk_barrier.h
