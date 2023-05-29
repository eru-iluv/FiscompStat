set terminal cairolatex standalone size 15cm, 15cm
set output "tarefa-3-graf-11820833.tex"

set title "Gráfico de $df$ para DLA" font ",20"
# set size sq
# set pointsize 2
set logscale x 10
set logscale y 10

f(x) = a1*x**df1
g(x) = a2*x**df2
h(x) = a3*x**df3
i(x) = a4*x**df4

fit f(x) '../saidas/tarefa-3/saida-13' u 2:1 via a1,df1
fit g(x) '../saidas/tarefa-3/saida-14' u 2:1 via a2,df2
fit h(x) '../saidas/tarefa-3/saida-15' u 2:1 via a3,df3
fit i(x) '../saidas/tarefa-3/saida-23' u 2:1 via a4,df4

set key left top
set xrange [1:105]
set xlabel "$r$"
set ylabel "$N$ de pontos"
plot  '../saidas/tarefa-3/saida-13' u 2:1 w lp ps 0.1 lc rgb "#00A6CEE3" t "" , \
      f(x) lc rgb "#1F78B4" t sprintf("1: $%.2f r^{%.3f}$", a1, df1),\
      '../saidas/tarefa-3/saida-14' u 2:1 w lp ps 0.1 lc rgb "#00B2DF8A" t "" , \
      g(x) lc rgb "#33A02C" t sprintf("2: $%.2f r^{%.3f}$", a2, df2),\
      '../saidas/tarefa-3/saida-15' u 2:1 w lp ps 0.1 lc rgb "#00FB9A99" t "" ,\
      h(x) lc rgb "#E31A1C" t sprintf("3: $%.2f r^{%.3f}$",a3, df3),\
      '../saidas/tarefa-3/saida-23' u 2:1 w lp ps 0.1 lc rgb "#00FDBF6F" t "" ,\
      i(x) lc rgb "#FF7F00"  t sprintf("4: $%.2f r^{%.3f}$", a4, df4)
