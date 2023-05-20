set terminal png size 1200,1000
set output "tarefa-4/tarefa-4-graf-11820833.png"
# reset 


set multiplot layout 2,2 \
    title "Evolução da DLA\n"\
    font ",20"

set ylabel "x"
set xlabel "y"
# set size sq
# set pointsize 2

set palette rgb 33,13,10

plot  'saidas/tarefa-4/saida-1' u 1:2:3 ps 0.5 lc palette z t ""
plot  'saidas/tarefa-4/saida-2' u 1:2:3 ps 0.5 lc palette z t ""
plot  'saidas/tarefa-4/saida-3' u 1:2:3 ps 0.5 lc palette z t ""
plot  'saidas/tarefa-4/saida-4' u 1:2:3 ps 0.5 lc palette z t ""
