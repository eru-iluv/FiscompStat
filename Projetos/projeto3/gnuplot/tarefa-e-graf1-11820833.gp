set terminal epslatex standalone size 20cm, 20cm  font ",14"
set output "tarefa-e-graf1-11820833.tex"
# reset 

set title "Evolução da onda com o tempo" 

set ylabel "Iteração $(n)$"
set xlabel "Espaço $(m)$"
# set size sq
unset key
set pointsize 2.5

N = system("awk 'NR==1{print NF}' ../saidas/saida-tratada-e")
plot for [i=1:N] "../saidas/saida-tratada-e" u ($0/100):i w l t "" lc 0 lw 4
