TARGET = $(BIN_ROOT)/Splash-3-barrier-elision/701.BARNES
#OBJS = code.o code_io.o load.o grav.o getparam.o util.o
OBJS = code.o code_io.o load.o grav.o getparam.o util.o #dr_annotations.o

include ../../Makefile.config

stdinc.h: code.h defs.h util.h vectmath.h load.h code_io.h grav.h getparam.h stdinc.h.in
code.o: code.c.in stdinc.h
code_io.o: code_io.c.in stdinc.h
getparam.o: getparam.c.in stdinc.h
grav.o: grav.c.in stdinc.h
load.o: load.c.in stdinc.h
util.o: util.c.in stdinc.h
#dr_annotations.o: dr_annotations.c.in dr_annotations.h dr_annotations_asm.h

