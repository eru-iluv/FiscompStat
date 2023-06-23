set terminal cairolatex standalone size 25cm, 25cm
set output "tarefa-c-graf-1-11820833.tex"


set multiplot layout 2,2 \
    title "Gráfico de $\\langle E \\rangle$\nLoop térmico" font ",20"

set xlabel "$\\beta$"
set xtic ("0" 0, "0,5" 501, "1" 1001, "1,5" 1501, "1,5" 2001, "1" 2501, "0,5" 3000, "0" 3500)

set ylabel "$\\langle E \\rangle$"

set title "$L = 60$"
plot  '../saidas/tarefa-c/L60/saida-b0.001' u 0:($3/3600) w l lw 5 lc rgb "#A6CEE3" t "$d\\beta = 0,001$", \
      '../saidas/tarefa-c/L60/saida-b0.0001' u ($0/10):($3/3600) w l lc rgb "#551F78B4" t "$d\\beta = 0,0001$"  

set title "$L = 80$"
plot     '../saidas/tarefa-c/L80/saida-b0.001' u 0:($3/6400) w l lw 5 lc rgb "#B2DF8A" t "$d\\beta = 0,001$",\
         '../saidas/tarefa-c/L80/saida-b0.0001' u ($0/10):($3/6400) w l lc rgb "#5533A02C" t "$d\\beta = 0,0001$"  

set title "$L = 100$"
plot     '../saidas/tarefa-c/L100/saida-b0.001' u 0:($3/10000) w l lw 5 lc rgb "#FDBF6F" t "$d\\beta = 0,001$",\
         '../saidas/tarefa-c/L100/saida-b0.0001' u ($0/10):($3/10000) w l lc rgb "#55FF7F00" t "$d\\beta = 0,0001$"  

