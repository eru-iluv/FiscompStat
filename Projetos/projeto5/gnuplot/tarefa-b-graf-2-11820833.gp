set terminal png size 650,450
set output "tarefa-b/tarefa-b-graf-2-11820833.png"
# reset 
set encoding utf8

set title "Configuração final\nTêmpera"\
    font ",12"

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

plot "saidas/tarefa-b/saida-tempera" matrix with image pixels t ""
