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

set terminal tikz createstyle color size 180mm,110mm
set output "figureS8_plt.tex"

set border lw 2
set key nobox
set key maxrows 1 outside center top vertical width 2 font ",15" samplen 2 spacing 2.5
set margin 7,1,1,5

set tics out

#set yrange[-10.4:-8.4]
set xrange[0:100]
set ytics 1 offset 1,0
set mytics 5
set tics font ",11"
set xtics 50
set mxtics 2
set ylabel "energy (kcal/mol)" font ",15" offset -1,-10
set style fill solid 0.8 noborder
set multiplot layout 2,3 spacing 0.2
array tit[6] = ["$\\mu^\\text{solv}_\\text{A}$","$\\mu^\\text{solv}_\\text{B}$","$\\ev{\\nu^\\text{solv}(\\psi)}_\\text{soln,A}$","$\\ev{\\nu^\\text{solv}(\\psi)}_\\text{soln,B}$","$\\ev{\\nu^\\text{solv}(\\psi)}_\\text{iso}$","Flexible BAR"]
set title "butanoic acid" font ",15" offset 0,-0.5
plot "04acid/a.dat" u 1:5 every ::0::200 w l dt (0.5,1.5) lw 4 lc rgb "red" title tit[3] at 0.41,1 ,\
     "04acid/b.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "blue" title tit[4] at 0.91,1,\
     "04acid/a.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "red" title tit[1] at 0.12,1,\
     "04acid/b.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "blue" title tit[2] at 0.62,1
unset ylabel
#set yrange[-9.6:-7.6]
set title "hexanoic acid" font ",15" offset 0,-0.5
plot "06acid/a.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "red" notitle ,\
     "06acid/b.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "blue" notitle ,\
     "06acid/a.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "red" notitle,\
     "06acid/b.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "blue" notitle
#set yrange[-9.8:-7.8]
set title "benzoic acid" font ",15" offset 0,-0.5
plot "Bacid/a.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "red" notitle  ,\
     "Bacid/b.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "blue" notitle ,\
     "Bacid/a.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "red" notitle,\
     "Bacid/b.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "blue" notitle 
#set yrange[-10.4:-8.4]
set title "$o$-toluic acid" font ",15" offset 0,-0.5
plot "Tacid/a.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "red" notitle  ,\
     "Tacid/b.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "blue" notitle ,\
     "Tacid/a.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "red" notitle,\
     "Tacid/b.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "blue" notitle 
#set yrange[-10.4:-8.4]
set xlabel "$N$" font ",15" offset 0,-1
set xtics 100
set xrange[0:500]
set title "salicylic acid" font ",15" offset 0,-0.5
plot "Sacid/a.dat" u 1:5 every ::0::500 w l lw 4 dt (0.5,1.5) lc rgb "red" notitle  ,\
     "Sacid/b.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "blue" notitle ,\
     "Sacid/a.dat" u 1:2 every ::0::500 w l lw 4 lc rgb "red" notitle,\
     "Sacid/b.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "blue" notitle 
#set yrange[-9.6:-7.6]
unset xlabel
set xtics 50
set xrange[0:100]
set title "$o$-anisic acid" font ",15" offset 0,-0.5
plot "Aacid/a.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "red" notitle  ,\
     "Aacid/b.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "blue" notitle ,\
     "Aacid/a.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "red" notitle,\
     "Aacid/b.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "blue" notitle 
