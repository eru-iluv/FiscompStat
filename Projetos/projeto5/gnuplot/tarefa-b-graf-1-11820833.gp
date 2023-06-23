set terminal png size 1000,500 
set output "tarefa-b/tarefa-b-graf-1-11820833.png"
# reset 
set encoding utf8

set multiplot layout 1,2 \
    title "Configuração final\nRecozimento"\
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

set title "1" font ",15"
plot "saidas/tarefa-b/saida-recozimento-1" matrix with image pixels t ""
set title "2"
plot "saidas/tarefa-b/saida-recozimento-2" matrix with image pixels t ""
