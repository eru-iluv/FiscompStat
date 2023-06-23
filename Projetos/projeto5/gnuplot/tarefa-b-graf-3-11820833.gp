set terminal cairolatex standalone size 20cm, 20cm
set output "tarefa-b-graf-3-11820833.tex"


set multiplot layout 2,2 \
    title "Gráfico de $\\langle E \\rangle$ e $\\langle m \\rangle$\nRecozimento" font ",20"

set xlabel "$t_{MC}$"
set title "Recozimento 1"

set ylabel "$\\langle E \\rangle$"
plot  '../saidas/tarefa-b/saida-emag-recozimento-1' u ($2/3600) w lp ps 0.15 lc rgb "#1F78B4" t "" 
set ylabel "$\\langle m \\rangle$"
plot     '../saidas/tarefa-b/saida-emag-recozimento-1' u ($1/3600) w lp ps 0.15 lc rgb "#33A02C" t ""
set title "Recozimento 2"
set ylabel "$\\langle E \\rangle$"
plot      '../saidas/tarefa-b/saida-emag-recozimento-2' u ($2/3600) w lp ps 0.15 lc rgb "#E31A1C" t ""
set ylabel "$\\langle m \\rangle$"
plot      '../saidas/tarefa-b/saida-emag-recozimento-2' u ($1/10000) w lp ps 0.15 lc rgb "#FF7F00" t ""
