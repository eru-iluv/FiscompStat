set terminal epslatex standalone size 25cm, 15cm
set output "tarefa-5-graf-11820833.tex"
# reset 


set style line 1 ps 1.5 lw 3
set style line 2 ps 1.5 lw 3

set xlabel "Número de pontos analisados"
set ylabel "Tempo médio"

set multiplot layout 1,2 \
    title "Tempo para realizar a\nTransformada de Fourier em função do tempo."\
    font ",18"

# set size sq
# set xtics 0.5*pi 
# set format x "${}\\pi$"
# show format


set key right top 


plot  '../dados/tarefa-5-11820833.out' u 1:2 w lp ls 1 lc 4 title "$\\overline{t}(N)$"
plot  '../dados/tarefa-5-11820833.out' u 1:3 w lp ls 2 lc 7 title "$\\sqrt(\\overline{t})(N)$"
