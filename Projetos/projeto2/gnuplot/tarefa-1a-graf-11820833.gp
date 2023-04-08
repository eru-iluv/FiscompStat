set terminal epslatex standalone size 20cm, 20cm  font ",14"
set output "tarefa-1a-graf-11820833.tex"
# reset 

set title "Evolução da onda com o tempo" 

set ylabel "Iteração $(n)$"
set xlabel "Espaço $(m)$"
# set size sq
unset key
set pointsize 2.5

N = system("awk 'NR==1{print NF}' ../dados/saida-r-1")
plot for [i=1:N] "../dados/saida-r-1" u ($0/300):i w l t "" lc 0 lw 4