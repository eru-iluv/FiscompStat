set terminal epslatex standalone size 15cm, 10cm
set output "graficoSinal.tex"
# reset 

set ylabel "$y(t)$"
set xlabel "t"


# set size sq

set key right bottom 
set key spacing 1


set pointsize 2.5

plot  'dados/arquivo_a.dat' u 1:2 with l ls 1 title "(a)"\
     ,'dados/arquivo_b.dat' u 1:2 with l ls 2 title "(b)" \
