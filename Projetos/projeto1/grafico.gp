set terminal epslatex standalone size 15cm, 10cm
set output "graficoSInal.tex"
# reset 

set ylabel "$y(t)$"
set xlabel "t"


# set size sq

set key right bottom 
set key spacing 1


set logscale xy
set pointsize 2.5

set format x "10^{%T}"
set format y "10^{%T}"



plot  'tmp.dat' using 1:2 with linespoints ls 1 title "Trapezio"\
     ,'tmp.dat' using 1:3 with linespoints ls 2 title "Simpson" \
     ,'tmp.dat' using 1:4 with linespoints ls 3 title "Boole"