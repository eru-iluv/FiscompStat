set terminal cairolatex standalone size 20cm, 20cm
set output "tarefa-d-graf-11820833.tex"


set  title "Tempo médio para mudança de sinal da magnetização" font ",20"

set xlabel "$L$"

# line styles
set style line 1 lt 1 lc rgb '#3b4A50' #
set style line 2 lt 1 lc rgb '#688aef' #
set style line 3 lt 1 lc rgb '#99baff' #
set style line 4 lt 1 lc rgb '#c9d8ef' #
set style line 5 lt 1 lc rgb '#edd1c2' #
set style line 6 lt 1 lc rgb '#f7a789' #
set style line 7 lt 1 lc rgb '#e36a53' #
set style line 8 lt 1 lc rgb '#b40426' #


set ylabel "Número de iterações"

 plot '../tarefa-d/saidas-Ls' w l lw 3 lc rgb '#553b4cc0'  t ""