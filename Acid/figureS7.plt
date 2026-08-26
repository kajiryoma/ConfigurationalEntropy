#plot.plt
reset

set terminal tikz createstyle color size 120mm,85mm
set output "figureS7_plt.tex"

set border lw 1
set key font ",13" outside top center maxrow 2 maxcol 3 spacing 1.5 offset -2,0.5
set tics out font ",13"
set margin 10,0,5,5
set xtics 60
set mxtics 6
set ytics 5 offset 0.5,0
set mytics 5
set yrange[0:20]
set ylabel "free energy (kcal/mol)" font ",13" offset -1,0
set xlabel "dihedral angle (degree)" font ",13" offset 0,-0.5
p "04acid/07_umbrella/ana/dist.pmf" u 1:2 w l lw 3 title "butanoic",\
"06acid/07_umbrella/ana/dist.pmf" u 1:2 w l lw 3 title "hexanoic",\
"Bacid/07_umbrella/ana/dist.pmf" u 1:2 w l lw 3 title "benzoic",\
"Tacid/07_umbrella/ana/dist.pmf" u 1:2 w l lw 3 title "$o$-toluic",\
"Sacid/07_umbrella/ana/dist.pmf" u 1:2 w l lw 3 title "salicylic",\
"Aacid/07_umbrella/ana/dist.pmf" u 1:2 w l lw 3 title "$o$-anisic"
