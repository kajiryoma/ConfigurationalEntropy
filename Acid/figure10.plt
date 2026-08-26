#plot.plt
reset

set terminal tikz createstyle color size 100mm,72mm
set output "figure10_plt.tex"

set border lw 1
set key font ",13"
set tics out font ",13"
set margin 10,1,5,1
set xtics 60
set mxtics 6
set ytics 4 offset 0.5,0
set mytics 4
set yrange[0:16]
set ylabel "free energy (kcal/mol)" font ",13" offset -1,0
set xlabel "dihedral angle (degree)" font ",13" offset 0,-0.5
p "Aacid/07_umbrella/ana/dist.pmf" u 1:2 w l lw 3 notitle
