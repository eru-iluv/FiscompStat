set terminal epslatex standalone size 15cm, 10cm
set output "graficoSinal_d.tex"
# reset 

set ylabel "$y(t)$"
set xlabel "t"


# set size sq

set key right bottom 
set key spacing 1


set pointsize 2.5

plot  'dados/arquivo_d.dat' u 1:2 with l ls 1 title "(d)"
