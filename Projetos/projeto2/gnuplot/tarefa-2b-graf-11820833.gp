set terminal epslatex standalone size 10cm, 10cm  font ",11"
set output "tarefa-2b-graf-11820833.tex"
# reset 

set title "Evolução da onda com o tempo" 

set ylabel "Iteração $(n)$"
set xlabel "Espaço $(m)$"
# set size sq
unset key
set pointsize 0.1
set ytics 0,1,5
set yrange [-3:15]

plot "../dados/saida-2-r-2" u ($0/600):6 w l lw 4 t ""\
    , for [i=1:5] "../dados/saida-2-r-2" u ($0/600):i w l t "" lc 0 lw 4