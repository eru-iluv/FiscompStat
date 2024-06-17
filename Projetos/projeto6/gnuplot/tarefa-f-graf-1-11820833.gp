set terminal png size 1600,800
set output "tarefa-f/tarefa-f-graf-1-11820833.png"

unset colorbox
# line styles

set multiplot layout 1,2 \
    title "Dinâmica Molecular\n "\
    font ",20"

set style line 1 lc rgb '#E41A1C' # red
set style line 2 lc rgb '#377EB8' # blue
set style line 3 lc rgb '#4DAF4A' # green
set style line 4 lc rgb '#984EA3' # purple
set style line 5 lc rgb '#FF7F00' # orange
set style line 6 lc rgb '#FFFF33' # yellow
set style line 7 lc rgb '#A65628' # brown
set style line 8 lc rgb '#F781BF' # pink

# palette
set palette maxcolors 8
set palette defined ( 0 '#E41A1C',\
    	    	      1 '#377EB8',\
		      2 '#4DAF4A',\
		      3 '#984EA3',\
		      4 '#FF7F00',\
		      5 '#FFFF33',\
		      6 '#A65628',\
		      7 '#F781BF' )

set yrange [0:4]
set xrange [0:4]


set title "Sólido Cristalino\nt = 16 a 30"
plot "tarefa-f/saida-f-1" u 1:2:3 ps 2 pt 3 lc palette z t ""
set title "Início da Liquifação\nt = 60 a 70"
plot "tarefa-f/saida-f-2" u 1:2:3 ps 2 pt 3 lc palette z t ""
