reset


set terminal tikz createstyle color size 100mm,90mm
set output "figureS3_plt.tex"

set tics out
set border lw 2
set key maxrow 3 maxcol 2 spacing 1 width 0.5 height 0.3 offset -3,1 noopaque
set yrange[-3:5]
set xrange[3.5:15.5]
set xtics 1 font ",12"
set ytics 2 font ",12" offset 1,0
set mytics 4
set ylabel "energy (kcal/mol)" font ",14" offset -1,0
set xlabel "chain length" font ",14" offset 0,-0.5
f(x) = 0
set key font ",14"
set margin 0,0,0,7
array tit[6] = ["$-T\\Delta_{\\text{A}\\rightarrow\\text{B}}S^\\text{conf}$",\
"$\\Delta_{\\text{A}\\rightarrow\\text{B}}\\ev{E(\\psi)}_\\text{soln}$",\
"$\\Delta_{\\text{A}\\rightarrow\\text{B}}\\ev{\\nu^\\text{solv}(\\psi)}_\\text{soln}$",\
"$\\Delta_{\\text{A}\\rightarrow\\text{B}}G_\\text{iso}$",\
"$\\Delta_{\\text{A}\\rightarrow\\text{B}}\\mu^\\text{solv}$",\
"$\\Delta_{\\text{A}\\rightarrow\\text{B}}\\ev{\\nu^\\text{solv}(\\psi)}$"]
p \
f(x) w l lw 1.8 dt (3.5,3.5) notitle,\
"alkane.dat" u 1:6 w linespoint lw 3 pt 10 ps 3 lc rgb "magenta" title tit[5] at 0.3,0.94,\
"alkane.dat" u 1:3 w linespoint lw 3 pt 8 ps 3 lc rgb "blue" title tit[2] at 0.85,0.85,\
"alkane.dat" u 1:5 w linespoint lw 3 pt 4 ps 2 lc rgb "cyan" title tit[3] at 0.3,0.85,\
"alkane.dat" u 1:2 w linespoint lw 3 pt 6 ps 2 lc rgb "red" title tit[4] at 0.85,0.94
