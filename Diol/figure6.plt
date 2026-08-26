reset
#end to end distance distribution function ( butane decane pentadecane)
set style line 1 lt 8 lc rgb "black" lw 2
set linestyle 1 lc rgb "black" lw 4
set linestyle 2 lc rgb "forest-green" lw 4

set linestyle 3 lc rgb "red" lw 4
set linestyle 4 lc rgb "red" lw 3
set linestyle 5 lc rgb "red" lw 3
set linestyle 6 lc rgb "dark-red" lw 5

set linestyle 7 lc rgb "blue" lw 3
set linestyle 8 lc rgb "blue" lw 3
set linestyle 9 lc rgb "blue" lw 3 dt (1,1)
set linestyle 10 lc rgb "midnight-blue" lw 5 dt 3

set linestyle 10 lw 1 pt 4 ps 0.9 lc rgb "midnight-blue"

set terminal tikz createstyle color size 180mm,55mm
set output "figure6_plt.tex"

set border lw 2
set key nobox
set key maxrows 1 outside center top vertical width 2 font ",15" samplen 2 spacing 2.5

#set key font ",10" spacing 2 samplen 2 offset -3,0

#set yrange[0.000001:1]
#set logscale y

#set format y "$10^{%L}$"
set format x "%.1f"
#set ytics add ("1" 1) offset 1,0
set ytics 20 offset 1,0 
set mytics 2
set tics font ",13" out
set xtics 0.1
set mxtics 5
set xrange[0.2:0.5]
set multiplot layout 1,3  margins 0.03,0.99,0.05,0.81 spacing 0.1
#set label 1 at screen 0.2,screen 0.85 "butane" font ",15"
#set label 2 at screen 0.45,screen 0.85 "decane" font ",15"
#set label 3 at screen 0.82, screen 0.85 "pentadecane" font ",15"
set ylabel "probability distribution ($\\text{nm}^{-1}$)" font ",13" offset -1,0
set xlabel "distance (nm)" offset 0,-0.5 font ",13"
set arrow from 0.36,0.0 to 0.36,80 nohead lw 3 dt (1,2) lc rgb "black"
set title "1,4-butanediol" font ",14" offset 0,-0.5
plot "04diol/01_solu/300.00/hist.dat" u 1:($2/2000) w l lw 3 lc rgb "red" title "isolated" at 0.7,1,\
     "04diol/02_soln/hist.dat" u 1:($2/2000) w l lw 3 lc rgb "blue" title "solution" at 0.4,1

unset ylabel
unset arrow
set ytics 2
set mytics 2
set arrow from 1.1,0.0 to 1.1,8 nohead lw 3 dt (1,2) lc rgb "black"
set xtics 0.5
set mxtics 5
set xrange[0.2:1.5]
set title "1,10-decanediol" font ",14" offset 0,-0.5
plot "10diol/01_solu/300.00/hist.dat" u 1:($2/10000) w l lw 3 lc rgb "red" notitle,\
     "10diol/02_soln/hist.dat" u 1:($2/10000) w l lw 3 lc rgb "blue" notitle
unset arrow 
set ytics 1
set mytics 2
set arrow from 1.72,0.0 to 1.72,4 nohead lw 3 dt (1,2) lc rgb "black"
set title "1,15-pentadecanediol" font ",14" offset 0,-0.5
set xrange[0.2:2.5]
plot "15diol/01_solu/300.00/hist.dat" u 1:($2/10000) w l lw 3 lc rgb "red" notitle,\
     "15diol/02_soln/hist.dat" u 1:($2/10000) w l lw 3 lc rgb "blue" notitle

