
# -*-Makefile-*-

UTIL = utils/utils.c arvoreAVL/avl.c jogos/jogo.c
MAIN = main.c
BINARY = executavel

all:
		gcc -std=c99 -Wall -g $(UTIL) $(MAIN) -o $(BINARY)

%.gp : %.tex
	gnuplot $@

graph all:
		gnuplot *.gp
		pdflatex *.tex
		make clean tex

clean tex:
		@rm *.log
		@rm *.aux
		@rm *.eps
		@rm *-eps-converted-to.pdf