set terminal jpeg standalone size 15cm, 15cm
set output "tarefa/tarefa-2-graf-11820833.png"
# reset 

set  title "Evolução da DLA" font ",14"

set ylabel "x"
set xlabel "y"
# set size sq
# set pointsize 2

set palette rgb 33,13,10

plot  'saidas/saida-2' u 1:2:3 lc palette z t ""

