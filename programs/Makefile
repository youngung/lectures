FC=gfortran
OBJDIR:=objdir

FLAGS= -finit-local-zero -fno-automatic\
	-fno-align-commons -finit-integer=zero\
	-fbackslash -fbounds-check -finit-real=zero\
	-fdefault-double-8 -fdefault-real-8 -g -fbacktrace -O3

objects=$(addprefix $(OBJDIR)/,euler.o calc_euler.o)


calcEuler: $(objects)
	$(FC) $(FLAGS) $(objects) -o calcEuler
ev: princ/ev.f
	$(FC) princ/ev.f -o ev -llapack

$(OBJDIR)/euler.o: texture/euler.f
	$(FC) $(FLAGS) -c texture/euler.f -o $(OBJDIR)/euler.o
$(OBJDIR)/calc_euler.o: texture/calc_euler.f texture/euler.f
	$(FC) $(FLAGS) -c texture/calc_euler.f -o $(OBJDIR)/calc_euler.o

.PHONY: all clean
all: calcEuler ev


$(objects): | $(OBJDIR)
$(OBJDIR):
	mkdir $(OBJDIR)

clean:
	-rm $(objects) ev calcEuler
