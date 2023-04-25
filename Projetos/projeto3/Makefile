MODULES = modulos/fourierMod.f90 modulos/ondasMod.f90 
UTIL = modulos/fourierMod.o modulos/ondasMod.o 
MAIN = tarefa-a-11820833

clean:
	@rm *.o 
compile:
	gfortran -c tarefa-a/${MAIN}.f90 -I modulos
	gfortran -o tarefa-a/${MAIN}.exe ${MAIN}.o ${UTIL}
	make clean

modules:
	gfortran -c ${MODULES}

run:
	./tarefa-a/${MAIN}.exe