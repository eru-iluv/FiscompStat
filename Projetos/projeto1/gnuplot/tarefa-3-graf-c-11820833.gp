set terminal epslatex standalone size 15cm, 10cm
set output "tarefa-3-graf-c-11820833.tex"
# reset 

set ylabel "Amplitude"
set xlabel "frequência"
set title "Transformada de Fourier"

# set size sq

set key right bottom 
set key spacing 1


set pointsize 2.5
# set yrange [0:450]
set xrange [0:12.6]

plot  '../dados/saida-c-11820833.out' u 1:2 with p ps 1.5 lt 7 lc rgb "#4694b9" title "Amplitude do seno"\
    , '../dados/saida-c-11820833.out' u 1:3 with p ps 1.5 lt 7 lc rgb "#b96b46" title "Amplitude do cosseno"
