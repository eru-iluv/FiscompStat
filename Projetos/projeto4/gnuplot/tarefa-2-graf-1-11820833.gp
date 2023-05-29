set terminal png size 1200,1000
set output "tarefa-2/tarefa-2-graf-1-11820833.png"
# reset 


set multiplot layout 2,2 \
    title "Evolução da DLA\n "\
    font ",20"

set ylabel "x"
set xlabel "y"
# set size sq
# set pointsize 2

set palette rgb 33,13,10

set title "1"
plot  'saidas/tarefa-2/saida-1' u 1:2:3 ps 0.5 lc palette z t ""
set title "2"
plot  'saidas/tarefa-2/saida-2' u 1:2:3 ps 0.5 lc palette z t ""
set title "3"
plot  'saidas/tarefa-2/saida-20' u 1:2:3 ps 0.5 lc palette z t ""
set title "4"
plot  'saidas/tarefa-2/saida-23' u 1:2:3 ps 0.5 lc palette z t ""
