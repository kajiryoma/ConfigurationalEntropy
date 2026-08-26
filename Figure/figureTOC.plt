reset


set terminal tikz createstyle color size 46.5mm,41.5mm
set output "figureTOC_plt.tex"

set tics out
set border lw 2
set key maxrow 3 maxcol 2 spacing 1 width 0.5 height 0.3 offset -3,1 noopaque samplen 2
#set yrange[-3:5]
set xrange[3.5:15.5]
set xtics 5 font ",10" offset 0,0.2
set ytics 1 font ",10" offset 1,0
set ylabel "$-T\\Delta S^\\text{conf}$ (kcal/mol)" font ",10"
set xlabel "alkyl-chain length" font ",10" offset 0,0.4
f(x) = 0
set key font ",14"
set margin 0,0,0,0
array tit[5] = ["$-T\\Delta_{\\text{A}\\rightarrow\\text{B}}S^\\text{conf}$",\
"$\\Delta_{\\text{A}\\rightarrow\\text{B}}\\ev{E(\\psi)+\\nu^\\text{solv}(\\psi)}_\\text{soln}$",\
"$\\Delta_{\\text{A}\\rightarrow\\text{B}}G_\\text{soln}$",\
"$\\Delta_{\\text{A}\\rightarrow\\text{B}}\\mu^\\text{solv}$",\
"$\\Delta_{\\text{A}\\rightarrow\\text{B}}\\ev{\\nu^\\text{solv}(\\psi)}$"]
p \
f(x) w l lw 1.8 dt (3.5,3.5) notitle,\
"alkane.dat" u 1:($8) w linespoint lw 3 pt 4 ps 2 lc rgb "forest-green" notitle tit[1] at 0.15,0.94
