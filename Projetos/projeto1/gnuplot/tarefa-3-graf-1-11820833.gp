set terminal epslatex standalone size 20cm, 10cm
set output "tarefa-3-graf-1-11820833.tex"
# reset 
# reset 


set style line 1 ps 1.5 lw 3
set style line 2 ps 1.5 lw 3
set style line 3 linecolor 2 ps 1.5 lw 3
set style line 1 linecolor 1 ps 1.5 lw 3

set xlabel "Tempo"
set ylabel "Amplitude do sinal\n"

set multiplot layout 1,2 \
    title "Gráfico dos sinais produzidos na tarefa 3\n "\
    font ",20"

# (a) N = 200, ∆t = 0.04, a1 = 2, a2 = 4, ω1 = 4πHz, ω2 = 2.5πHz
# (b) N = 200, ∆t = 0.04, a1 = 3, a2 = 2, ω1 = 4πHz, ω2 = 2.5πHz
# (c) N = 200, ∆t = 0.4, a1 = 2, a2 = 4, ω1 = 4πHz, ω2 = 0.2πHz
# (d) N = 200, ∆t = 0.4, a1 = 3, a2 = 2 ω1 = 4πHz, ω2 = 0.2πHz


# set size sq
# set xtics 0.5*pi 
# set format x "${}\\pi$"
# show format

set xrange [0:8]
set xtic ("$0.5\\pi$" 0.5*pi, "$1\\pi$" pi, "$1.5\\pi$" 1.5*pi, "$2\\pi$" 2*pi, "$2.5\\pi$" 2.5*pi)

set key right top font ",24"
set key opaque box lt -1 lw 2
set border back
set label front
# set pointsize 2.5
set xrange [-0.2:8.2]


plot  '../dados/arquivo_e.dat' u 1:2 w lp ls 1 lc 4 title "(e)"
plot  '../dados/arquivo_f.dat' u 1:2 w lp ls 2 lc 7 title "(f)" 
