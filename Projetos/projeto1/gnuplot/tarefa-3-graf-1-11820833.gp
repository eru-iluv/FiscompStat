set terminal epslatex standalone size 20cm, 20cm
set output "tarefa-3-graf-1-11820833.tex"
# reset 

set multiplot layout 2,2 \
    title "Espectro dos Sinais\n "\
    font ",20"

set ylabel "Amplitude"
set xlabel "Frequência ($Hz$)"
# set size sq

set key right bottom
set key spacing 1
set key opaque box lt -1 lw 2

set pointsize 2.5

set xtic ("0" 0, "$\\pi$" 0.5, "$2\\pi$" 1, "$3\\pi$" 1.5, "$4\\pi$" 2, "$4\\pi$" 2)
set title "Espaço Frequências do sinal $(a)$"
plot  '../dados/saida-a-11820833.out' every ::0::20 u 1:($2/100) with p ps 1.5 lt 7 lc rgb "#4694b9" title "seno"\
    , '../dados/saida-a-11820833.out' every ::0::20 u 1:($3/100) with p ps 1.5 lt 7 lc rgb "#b96b46" title "cosseno"

set title "Espaço Frequências do sinal $(b)$"
plot  '../dados/saida-b-11820833.out' every ::0::20 u 1:($2/100) with p ps 1.5 lt 7 lc rgb "#4694b9" title "seno"\
    , '../dados/saida-b-11820833.out' every ::0::20 u 1:($3/100) with p ps 1.5 lt 7 lc rgb "#b96b46" title "cosseno"

set xtic ("0" 0, "$0,2\\pi$" 0.1, "$0,4\\pi$" 0.2, "$0,6\\pi$" .3, "$0,8\\pi$" 0.4, "$\\pi$" 0.5, "" 0.6)
set title "Espaço Frequências do sinal $(c)$"
plot  '../dados/saida-c-11820833.out' every ::0::48 u 1:($2/100) with p ps 1.5 lt 7 lc rgb "#4694b9" title "seno"\
    , '../dados/saida-c-11820833.out' every ::0::48 u 1:($3/100) with p ps 1.5 lt 7 lc rgb "#b96b46" title "cosseno"

set title "Espaço Frequências de $(d)$"
plot  '../dados/saida-d-11820833.out' every ::0::48 u 1:($2/100) with p ps 1.5 lt 7 lc rgb "#4694b9" title "seno"\
    , '../dados/saida-d-11820833.out' every ::0::48 u 1:($3/100) with p ps 1.5 lt 7 lc rgb "#b96b46" title "cosseno"
