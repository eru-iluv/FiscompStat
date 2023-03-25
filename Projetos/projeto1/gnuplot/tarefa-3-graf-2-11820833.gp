set terminal epslatex standalone size 20cm, 10cm
set output "tarefa-3-graf-2-11820833.tex"
# reset 

set multiplot layout 1,2 \
    title "Espectro dos Sinais\n "\
    font ",20"

set ylabel "Amplitude"
set xlabel "Frequência Angular ($Hz$)"
# set size sq

set key right bottom
set key spacing 1
set key opaque box lt -1 lw 2

set pointsize 2.5

set xtic ("0" 0, "$\\pi$" 0.5, "$2\\pi$" 1, "$3\\pi$" 1.5, "$4\\pi$" 2, "$4\\pi$" 2)
set title "Espaço Frequências do sinal $(e)$"
plot  '../dados/saida-e-11820833.out' every ::0::25 u 1:($2/100) with p ps 1.5 lt 7 lc rgb "#4694b9" title "seno"\
    , '../dados/saida-e-11820833.out' every ::0::25 u 1:($3/100) with p ps 1.5 lt 7 lc rgb "#b96b46" title "cosseno"

set title "Espaço Frequências do sinal $(f)$"
plot  '../dados/saida-f-11820833.out' every ::0::25 u 1:($2/100) with p ps 1.5 lt 7 lc rgb "#4694b9" title "seno"\
    , '../dados/saida-f-11820833.out' every ::0::25 u 1:($3/100) with p ps 1.5 lt 7 lc rgb "#b96b46" title "cosseno"

