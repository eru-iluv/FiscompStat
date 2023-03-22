set terminal epslatex standalone size 25cm, 15cm
set output "tarefa-4-graf-11820833.tex"
# reset 


set style line 1 ps 1.5 lw 3
set style line 2 ps 1.5 lw 3

set xlabel "$t$"
set ylabel "Amplitude do sinal"

set multiplot layout 1,2 \
    title "Comparação do sinal (a)\ncom o produzido pela inversa da transformada "\
    font ",18"

# set size sq
# set xtics 0.5*pi 
# set format x "${}\\pi$"
# show format

set xrange [0:8]
set xtic ("$0.5\\pi$" 0.5*pi, "$1\\pi$" pi, "$1.5\\pi$" 1.5*pi, "$2\\pi$" 2*pi, "$2.5\\pi$" 2.5*pi)

set key right top 

# set pointsize 2.5
set xrange [-0.2:8.2]
# set yrange [-6:6.5]

plot  '../dados/arquivo_a.dat' u 1:2 w lp ls 1 lc 4 title "Sinal (a)"
plot  '../dados/saida-ainversa-11820833.out' u 1:2 w lp ls 2 lc 7 title "Inversa da\nTransformada em (a)"
