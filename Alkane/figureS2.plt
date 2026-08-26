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
set output "figureS2_plt.tex"

set border lw 2
set key nobox
set key maxrows 1 outside center top vertical width 2 font ",15" samplen 2 spacing 2.5
set margin 7,1,1,5

set tics out
set format y "%.1f"
set yrange[2.5:2.9]
set xrange[0:40]
set ytics 0.2 offset 1,0
set mytics 2
set tics font ",11"
set xtics 10
set mxtics 2
set ylabel "energy (kcal/mol)" font ",15" offset -1,-25
set style fill solid 0.8 noborder
set multiplot layout 4,3 spacing 0.2
array tit[6] = ["$\\mu^\\text{solv}_\\text{A}$","$\\mu^\\text{solv}_\\text{B}$","$\\ev{\\nu^\\text{solv}(\\psi)}_\\text{soln,A}$","$\\ev{\\nu^\\text{solv}(\\psi)}_\\text{soln,B}$","$\\ev{\\nu^\\text{solv}(\\psi)}_\\text{iso}$","Flexible BAR"]
set title "butane" font ",15" offset 0,-0.5
plot "04alk/a.dat" u 1:5 every ::0::200 w l dt (0.5,1.5) lw 4 lc rgb "red" title tit[3] at 0.41,1 ,\
     "04alk/b.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "blue" title tit[4] at 0.91,1,\
     "04alk/a.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "red" title tit[1] at 0.12,1,\
     "04alk/b.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "blue" title tit[2] at 0.62,1
unset ylabel
#set yrange[-9.6:-7.6]
set title "pentane" font ",15" offset 0,-0.5
plot "05alk/a.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "red" notitle ,\
     "05alk/b.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "blue" notitle ,\
     "05alk/a.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "red" notitle,\
     "05alk/b.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "blue" notitle
set yrange[3:3.4]
set title "hexane" font ",15" offset 0,-0.5
plot "06alk/a.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "red" notitle  ,\
     "06alk/b.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "blue" notitle ,\
     "06alk/a.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "red" notitle,\
     "06alk/b.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "blue" notitle 
set yrange[3.2:3.6]
set title "heptane" font ",15" offset 0,-0.5
plot "07alk/a.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "red" notitle  ,\
     "07alk/b.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "blue" notitle ,\
     "07alk/a.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "red" notitle,\
     "07alk/b.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "blue" notitle 
set yrange[3.4:3.8]
set title "octane" font ",15" offset 0,-0.5
plot "08alk/a.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "red" notitle  ,\
     "08alk/b.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "blue" notitle ,\
     "08alk/a.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "red" notitle,\
     "08alk/b.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "blue" notitle 
set yrange[3.7:4.1]
set title "nonane" font ",15" offset 0,-0.5
plot "09alk/a.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "red" notitle  ,\
     "09alk/b.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "blue" notitle ,\
     "09alk/a.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "red" notitle,\
     "09alk/b.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "blue" notitle 
set yrange[3:3.4]
set title "decane" font ",15" offset 0,-0.5
plot "10alk/a.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "red" notitle  ,\
     "10alk/b.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "blue" notitle ,\
     "10alk/a.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "red" notitle,\
     "10alk/b.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "blue" notitle 
set yrange[4.2:4.6]
set title "undecane" font ",15" offset 0,-0.5
plot "11alk/a.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "red" notitle  ,\
     "11alk/b.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "blue" notitle ,\
     "11alk/a.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "red" notitle,\
     "11alk/b.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "blue" notitle
set yrange[4.2:4.6]
set title "dodecane" font ",15" offset 0,-0.5
plot "12alk/a.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "red" notitle  ,\
     "12alk/b.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "blue" notitle ,\
     "12alk/a.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "red" notitle,\
     "12alk/b.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "blue" notitle
set yrange[4.0:4.4]
set title "tridecane" font ",15" offset 0,-0.5
plot "13alk/a.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "red" notitle  ,\
     "13alk/b.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "blue" notitle ,\
     "13alk/a.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "red" notitle,\
     "13alk/b.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "blue" notitle
set yrange[4.8:5.2]
set xlabel "$N$" font ",15" offset 0,-1
set title "tetradecane" font ",15" offset 0,-0.5
plot "14alk/a.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "red" notitle  ,\
     "14alk/b.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "blue" notitle ,\
     "14alk/a.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "red" notitle,\
     "14alk/b.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "blue" notitle
set yrange[4.6:5]
unset xlabel
set title "pentadecane" font ",15" offset 0,-0.5
plot "15alk/a.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "red" notitle  ,\
     "15alk/b.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "blue" notitle ,\
     "15alk/a.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "red" notitle,\
     "15alk/b.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "blue" notitle

