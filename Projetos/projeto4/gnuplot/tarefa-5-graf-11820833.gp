set terminal cairolatex standalone size 20cm, 20cm
set output "tarefa-5-graf-11820833.tex"

set title "Gráfico de $df$ para diferentes $p$\nModelo de Revoluções" font ",20"
# set size sq
# set pointsize 2
set logscale x 10
set logscale y 10

f(x) = a1*x**df1
g(x) = a3*x**df3
h(x) = a5*x**df5
i(x) = a8*x**df8

# fit f(x) '../saidas/tarefa-5/saida-1' u 2:1 via a1,df1
# fit g(x) '../saidas/tarefa-5/saida-3' u 2:1 via a3,df3
# fit h(x) '../saidas/tarefa-5/saida-5' u 2:1 via a5,df5
# fit i(x) '../saidas/tarefa-5/saida-8' u 2:1 via a8,df8

set key bottom right
set xlabel "$r$"
set ylabel "$N$ de pontos"
plot  '../saidas/tarefa-5/saida-1' u 2:1 w lp ps 0.1 lc rgb "#00A6CEE3" t "$p =0,1$" , \
      '../saidas/tarefa-5/saida-3' u 2:1 w lp ps 0.1 lc rgb "#00B2DF8A" t "$p =0,3$" , \
      '../saidas/tarefa-5/saida-2' u 2:1 w lp ps 0.1 lc rgb "#1F78B4" t "$p =0,2$" , \
      '../saidas/tarefa-5/saida-4' u 2:1 w lp ps 0.1 lc rgb "#33A02C" t "$p =0,4$" , \
      '../saidas/tarefa-5/saida-5' u 2:1 w lp ps 0.1 lc rgb "#00FB9A99" t "$p =0,5$" ,\
      '../saidas/tarefa-5/saida-6' u 2:1 w lp ps 0.1 lc rgb "#E31A1C" t "$p =0,6$" ,\
      '../saidas/tarefa-5/saida-7' u 2:1 w lp ps 0.1 lc rgb "#00FB9A99" t "$p =0,7$" ,\
      '../saidas/tarefa-5/saida-8' u 2:1 w lp ps 0.1 lc rgb "#FF7F00" t "$p =0,8$" ,\
      '../saidas/tarefa-5/saida-9' u 2:1 w lp ps 0.1 lc rgb "#000000" t "$p =0,9$" ,\


