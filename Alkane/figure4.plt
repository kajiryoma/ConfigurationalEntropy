reset

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

set terminal tikz createstyle color size 100mm,80mm
set output "figure4_plt.tex"

set border lw 2
set key nobox
set key maxrows 1  right top vertical width -5 font ",15" offset -2,0 samplen 2 spacing 2
set tics out
set yrange[4.6:5]
set xrange[0:40]
set ytics 0.1 offset 1,0
set mytics 5
set tics font ",15"
set format y "%.1f"
set xtics 10 offset 0,-0.5
set mxtics 2
set ylabel "energy (kcal/mol)" font ",15" offset -1,0
set xlabel "$N$" font ",15" offset 0,-1
set style fill solid 0.8 noborder
set margin 4,1,1,1
array tit[6] = ["$\\mu^\\text{solv}_\\text{A}$","$\\mu^\\text{solv}_\\text{B}$","$\\ev{\\nu^\\text{solv}(\\psi)}_\\text{soln,A}$","$\\ev{\\nu^\\text{solv}(\\psi)}_\\text{soln,B}$","$\\ev{\\zeta(\\psi)}_\\text{iso}$","Flexible BAR"]
plot    "15alk/a.dat" u 1:2 w l lw 4.5 lc rgb "red" title tit[1] at 0.3,0.12,\
     "15alk/b.dat" u 1:2 w l lw 4.5 lc rgb "blue" title tit[2] at 0.3,0.88,\
     "15alk/a.dat" u 1:5 w l lw 4.5 dt (0.4,2) lc rgb "red" title tit[3] at 0.83,0.12,\
     "15alk/b.dat" u 1:5 w l lw 4.5 dt (0.4,2) lc rgb "blue" title tit[4] at 0.83,0.88
