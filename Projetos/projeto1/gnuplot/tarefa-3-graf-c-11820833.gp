set terminal epslatex standalone size 20cm, 30cm
set output "tarefa-3-graf-1-11820833.tex"
# reset 

set multiplot layout 2,1 \
    title "Espectro dos Sinais"\
    font ",20"

set ylabel "Amplitude"
set xlabel "Frequência"
# set size sq

set key right bottom 
set key spacing 1


set pointsize 2.5

set title "Espaço Frequências do sinal $(a)$"
plot  '../dados/saida-a-11820833.out' u 1:2 with p ps 1.5 lt 7 lc rgb "#4694b9" title "Amplitude do seno"\
    , '../dados/saida-a-11820833.out' u 1:3 with p ps 1.5 lt 7 lc rgb "#b96b46" title "Amplitude do cosseno"

set title "Espaço Frequências do sinal $(b)$"
plot  '../dados/saida-b-11820833.out' u 1:2 with p ps 1.5 lt 7 lc rgb "#4694b9" title "Amplitude do seno"\
    , '../dados/saida-b-11820833.out' u 1:3 with p ps 1.5 lt 7 lc rgb "#b96b46" title "Amplitude do cosseno"

#set title "Espaço Frequências do sinal $(c)$"
#plot  '../dados/saida-c-11820833.out' u 1:2 with p ps 1.5 lt 7 lc rgb "#4694b9" title "Amplitude do seno"\
#    , '../dados/saida-c-11820833.out' u 1:3 with p ps 1.5 lt 7 lc rgb "#b96b46" title "Amplitude do cosseno"

#set title "Espaço Frequências do sinal $(d)$"
#plot  '../dados/saida-d-11820833.out' u 1:2 with p ps 1.5 lt 7 lc rgb "#4694b9" title "Amplitude do seno"\
#    , '../dados/saida-d-11820833.out' u 1:3 with p ps 1.5 lt 7 lc rgb "#b96b46" title "Amplitude do cosseno"
