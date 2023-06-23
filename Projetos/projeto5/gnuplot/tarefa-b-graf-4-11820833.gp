set terminal cairolatex standalone size 25cm, 12.5cm
set output "tarefa-b-graf-4-11820833.tex"


set multiplot layout 1,2 \
    title "Gráfico de $\\langle E \\rangle$ e $\\langle m \\rangle$\nTempera" font ",20"

set xlabel "$t_{MC}$"
set ylabel "$\\langle E \\rangle$"
plot  '../saidas/tarefa-b/saida-emag-tempera' u ($2/3600) w lp ps 0.15 lc rgb "#1F78B4" t "" 
set ylabel "$\\langle m \\rangle$"
plot     '../saidas/tarefa-b/saida-emag-tempera' u ($1/3600) w lp ps 0.15 lc rgb "#33A02C" t ""
