set terminal epslatex standalone size 20cm, 20cm  font ",14"
set output "tarefa-1b-graf-11820833.tex"
# reset 

set title "Evolução da onda com o tempo" 

set ylabel "Iteração $(n)$"
set xlabel "Espaço $(m)$"
# set size sq
unset key
set pointsize 0.1
set ytics 0,2,16

plot "../dados/saida-r-2" u ($0/600):17 w l lw 4 t ""\
    , for [i=1:16] "../dados/saida-r-2" u ($0/600):i w l t "" lc 0 lw 4