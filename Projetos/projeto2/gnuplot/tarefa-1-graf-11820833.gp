set terminal epslatex standalone size 20cm, 20cm
set output "tarefa-1-graf-11820833.tex"
# reset 

set title "Evolução da onda com o tempo\n "
set font ",20"

set ylabel "Iteração $(n)$"
set xlabel "Espaço $(L)$"
# set size sq
unset key
set pointsize 2.5

N = system("awk 'NR==1{print NF}' ../dados/saida-transposta")
plot for [i=1:N] "../dados/saida-transposta" u ($0/300):i w l t "" lc 0 lw 4