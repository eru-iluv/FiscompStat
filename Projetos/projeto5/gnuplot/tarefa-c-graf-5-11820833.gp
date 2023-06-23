set terminal cairolatex standalone size 20cm, 20cm
set output "tarefa-c-graf-5-11820833.tex"


set  title "Gráfico de $\\langle E \\rangle$\npara diferentes $\\beta$; $L = 100$" font ",20"

set xlabel "$t_{MC}$"

# line styles
set style line 1 lt 1 lc rgb '#3b4A50' #
set style line 2 lt 1 lc rgb '#688aef' #
set style line 3 lt 1 lc rgb '#99baff' #
set style line 4 lt 1 lc rgb '#c9d8ef' #
set style line 5 lt 1 lc rgb '#edd1c2' #
set style line 6 lt 1 lc rgb '#f7a789' #
set style line 7 lt 1 lc rgb '#e36a53' #
set style line 8 lt 1 lc rgb '#b40426' #


set ylabel "$\\langle E \\rangle$"
set yrange [-0.74:-2]

 plot '../saidas/tarefa-c/L100/saida-b0.35' u 0:($3/10000) w l lw 3 lc rgb '#553b4cc0'  t "$\\beta = 0,35$", \
      '../saidas/tarefa-c/L100/saida-b0.40' u 0:($3/10000) w l lw 2 lc rgb '#A53b4cc0' t "", \
      '../saidas/tarefa-c/L100/saida-b0.41' u 0:($3/10000) w l lw 2 lc rgb '#A5688aef' t "", \
      '../saidas/tarefa-c/L100/saida-b0.42' u 0:($3/10000) w l lw 2 lc rgb '#A599baff' t "", \
      '../saidas/tarefa-c/L100/saida-b0.43' u 0:($3/10000) w l lw 2 lc rgb '#A5c9d8ef' t "", \
      '../saidas/tarefa-c/L100/saida-b0.45' u 0:($3/10000) w l lw 2 lc rgb '#A5edd1c2' t "", \
      '../saidas/tarefa-c/L100/saida-b0.46' u 0:($3/10000) w l lw 2 lc rgb '#A5f7a789' t "", \
      '../saidas/tarefa-c/L100/saida-b0.47' u 0:($3/10000) w l lw 2 lc rgb '#A5e36a53' t "", \
      '../saidas/tarefa-c/L100/saida-b0.48' u 0:($3/10000) w l lw 2 lc rgb '#A5b40426' t "", \
      '../saidas/tarefa-c/L100/saida-b0.55' u 0:($3/10000) w l lw 3 lc rgb '#55b40426' t "$\\beta = 0,55$", \
     '../saidas/tarefa-c/L100/saida-b0.44' u 0:($3/10000) w l lw 4 lc rgb "#440154" t "$d\\beta = 0,44$"
