set terminal png size 1000,1000 
set output "tarefa-a/tarefa-a-graf-1-11820833.png"
# reset 
set encoding utf8

set multiplot layout 2,2 \
    title "Configuração final\n"\
    font ",20"

set ylabel ""
set xlabel ""
# set size sq
# set pointsize 2
# palette
set palette defined ( 0 '#F7FCF0',\
    	    	      1 '#E0F3DB',\
		      2 '#CCEBC5',\
		      3 '#A8DDB5',\
		      4 '#7BCCC4',\
		      5 '#4EB3D3',\
		      6 '#2B8CBE',\
		      7 '#08589E' )
set cbrange [-1:1]

set xrange [-1:60]
set yrange [-1:60]

unset colorbox

unset xtics
unset ytics 

set title "L = 60, β = 0,1" font ",15"
plot "saidas/tarefa-a/saida-L60-b0.1" matrix with image pixels t ""
set title "L = 60, β = 3"
plot "saidas/tarefa-a/saida-L60-b3" matrix with image pixels t ""

set xrange [-1:100]
set yrange [-1:100]
set title "L = 100, β = 0,1"
plot "saidas/tarefa-a/saida-L100-b0.1" matrix with image pixels t ""
set title "L = 100, β = 3"
plot "saidas/tarefa-a/saida-L100-b3" matrix with image pixels t ""

