set terminal png size 1000,1000
set output "tarefa-e/tarefa-e-graf-2-11820833.png"

unset colorbox
# line styles

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


set title "Dinâmica molecular\nDe t = 13 a t = 16"
plot "tarefa-e/saida-e-3" u 1:2:3 ps 2 pt 6 lc palette z t ""
