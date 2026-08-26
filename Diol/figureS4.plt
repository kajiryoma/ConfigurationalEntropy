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

set terminal tikz createstyle color size 180mm,210mm
set output "tikz_plt.tex"

set border lw 2
set key nobox
set key maxrows 1 outside center top vertical width 2 font ",15" samplen 2 spacing 2.5
set margin 7,2,2,4

#set format y "%.2f"
set format x "%.1f"
set ytics 20 offset 1,0 
set tics font ",13" out
set xtics 0.1
set mxtics 5
set xrange[0.2:0.5]
#set yrange[0:0.2]
set multiplot layout 4,3  spacing 0.2
set ylabel "probability distribution ($\\text{nm}^{-1}$)" font ",15" offset -1,-25

set arrow from 0.36,0 to 0.36,80 nohead lw 3 dt (1,2) lc rgb "black"
set title "1,4-butanediol" font ",15" offset 0,-0.5
plot "04diol/01_solu/300.00/hist.dat" u 1:($2/2000) w l lw 3 lc rgb "red" title "isolated" at 0.7,1,\
     "04diol/02_soln/hist.dat" u 1:($2/2000) w l lw 3 lc rgb "blue" title "solution" at 0.4,1

unset arrow
unset ylabel
set arrow from 0.48,0 to 0.48,50 nohead lw 3 dt (1,2) lc rgb "black"
set xrange[0.2:0.7]
#set yrange[0:50]
set ytics 10
set title "1,5-pentanediol" font ",15" offset 0,-0.5
plot "05diol/01_solu/300.00/histo.dat" u 1:($2/2000) w l lw 3 lc rgb "red" notitle,\
     "05diol/02_soln/histo.dat" u 1:($2/2000) w l lw 3 lc rgb "blue" notitle

unset arrow
unset xlabel
unset ylabel
set arrow from 0.61,0 to 0.61,40 nohead lw 3 dt (1,2) lc rgb "black"
set xrange[0.2:0.7]
set title "1,6-hexanediol" font ",15" offset 0,-0.5
plot "06diol/01_solu/300.00/histo.dat" u 1:($2/2000) w l lw 3 lc rgb "red" notitle,\
     "06diol/02_soln/histo.dat" u 1:($2/2000) w l lw 3 lc rgb "blue" notitle

unset arrow
unset xlabel
unset ylabel 
set xrange[0.2:1]
#set yrange[0:20]
set xtics 0.2
set ytics 5
set mxtics 4
set arrow from 0.73,0 to 0.73,20 nohead lw 3 dt (1,2) lc rgb "black"
set title "1,7-heptanediol" font ",15" offset 0,-0.5
set xrange[0.2:1]
plot "07diol/01_solu/300.00/hist.dat" u 1:($2/10000) w l lw 3 lc rgb "red" notitle,\
     "07diol/02_soln/hist.dat" u 1:($2/10000) w l lw 3 lc rgb "blue" notitle

unset arrow 
unset xlabel
unset ylabel
set arrow from 0.86,0 to 0.86,15 nohead lw 3 dt (1,2) lc rgb "black"
set title "1,8-octanediol" font ",15" offset 0,-0.5
#set yrange[0:15]
plot "08diol/01_solu/300.00/hist.dat" u 1:($2/10000) w l lw 3 lc rgb "red" notitle,\
     "08diol/02_soln/hist.dat" u 1:($2/10000) w l lw 3 lc rgb "blue" notitle

unset arrow 
unset label
set xrange[0.2:1.5]
#set yrange[0:12]
set ytics 2
set xtics 0.5
set mxtics 5
set arrow from 0.98,0 to 0.98,12 nohead lw 3 dt (1,2) lc rgb "black"
set title "1,9-nonanediol" font ",15" offset 0,-0.5
plot "09diol/01_solu/300.00/hist.dat" u 1:($2/10000) w l lw 3 lc rgb "red" notitle,\
     "09diol/02_soln/hist.dat" u 1:($2/10000) w l lw 3 lc rgb "blue" notitle

unset arrow 
unset label
#set yrange[0:8]
set ytics 2
set arrow from 1.11,0 to 1.11,8 nohead lw 3 dt (1,2) lc rgb "black"
set title "1,10-decanediol" font ",15" offset 0,-0.5
set xrange[0.2:1.5]
plot "10diol/01_solu/300.00/hist.dat" u 1:($2/10000) w l lw 3 lc rgb "red" notitle,\
     "10diol/02_soln/hist.dat" u 1:($2/10000) w l lw 3 lc rgb "blue" notitle

unset arrow 
unset label
set arrow from 1.23,0 to 1.23,6 nohead lw 3 dt (1,2) lc rgb "black"
set title "1,11-undecanediol" font ",15" offset 0,-0.5
plot "11diol/01_solu/300.00/hist.dat" u 1:($2/10000) w l lw 3 lc rgb "red" notitle,\
     "11diol/02_soln/hist.dat" u 1:($2/10000) w l lw 3 lc rgb "blue" notitle

unset arrow 
unset label
#set yrange[0:5]
set xrange[0.2:2]
set ytics 1
set arrow from 1.36,0 to 1.36,5 nohead lw 3 dt (1,2) lc rgb "black"
set title "1,12-dodecanediol" font ",15" offset 0,-0.5
plot "12diol/01_solu/300.00/hist.dat" u 1:($2/10000) w l lw 3 lc rgb "red" notitle,\
     "12diol/02_soln/hist.dat" u 1:($2/10000) w l lw 3 lc rgb "blue" notitle

unset arrow
unset label 
set yrange [0:5]
set arrow from 1.48,0 to 1.48,5 nohead lw 3 dt (1,2) lc rgb "black"
set title "1,13-tridecanediol" font ",15" offset 0,-0.5
plot "13diol/01_solu/300.00/hist.dat" u 1:($2/10000) w l lw 3 lc rgb "red" notitle,\
     "13diol/02_soln/hist.dat" u 1:($2/10000) w l lw 3 lc rgb "blue" notitle

unset arrow
unset label 
set yrange[0:4]
set xlabel "end-to-end distance (nm)" offset 0,-0.5 font ",15"
set arrow from 1.6,0 to 1.6,4 nohead lw 3 dt (1,2) lc rgb "black"
set title "1,14-tetradecanediol" font ",15" offset 0,-0.5
plot "14diol/01_solu/300.00/hist.dat" u 1:(($2*100)/965954) w l lw 3 lc rgb "red" notitle,\
     "14diol/02_soln/hist.dat" u 1:($2/10000) w l lw 3 lc rgb "blue" notitle

unset arrow
unset xlabel 
set arrow from 1.73,0 to 1.73,4 nohead lw 3 dt (1,2) lc rgb "black"
set title "1,15-pentadecanediol" font ",15" offset 0,-0.5
plot "15diol/01_solu/300.00/hist.dat" u 1:(($2*100)/940201) w l lw 3 lc rgb "red" notitle,\
     "15diol/02_soln/hist.dat" u 1:($2/10000) w l lw 3 lc rgb "blue" notitle

