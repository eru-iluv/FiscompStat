set terminal epslatex standalone size 20cm, 13cm
set output "tarefa-c-graf-11820833.tex"
# reset 

set  title "Espectro dos Sinais" font ",20"

set ylabel "Amplitude"
set xlabel "Frequência ($Hz$)"
# set size sq

set pointsize 2
set xtics 150, 300, 6000
set mxtics 2
set grid mxtics xtics ls 100, ls 101
set title "Espaço Frequências do sinal $(c)$"
plot  '../saidas/saida-c' every 10::0::1300 u 1:($2/60000) with p ps 1.5 lt 7 lc rgb "#4694b9" t ""