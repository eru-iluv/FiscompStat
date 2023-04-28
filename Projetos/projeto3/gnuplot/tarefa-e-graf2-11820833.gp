set terminal epslatex standalone size 20cm, 13cm
set output "tarefa-e-graf2-11820833.tex"
# reset

set  title "Espectro dos Sinais" font ",20"

set ylabel "Amplitude"
set xlabel "Frequência ($Hz$)"
# set size sq
set pointsize 2

set xtics 75, 600, 6000
set mxtics 4
set grid mxtics xtics ls 103, ls 101

# set grid x2tics
# set x2tics 0, 3000, 6000  format "" scale 0


set title "Espaço Frequências do sinal $(e)$"
plot  '../saidas/saida-e' every 1::0::1700 u 1:($2/20000) with p ps 1.5 lt 7 lc rgb "#4694b9" t ""
