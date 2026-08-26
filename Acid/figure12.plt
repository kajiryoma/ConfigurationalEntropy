#plot.plt
reset

set terminal tikz createstyle color size 130mm,100mm
set output "figure12_plt.tex"

set border lw 2
set margin 7,0,0,6
set key font ",14"
set tics out font ",14"
set ytics 2 offset 0.5,0
set mytics 2
set yrange[-6:12]
set xtics ("　　butanoic" 1, "　　hexanoic" 5, "　　benzoic" 9, "　　$o$-toluic" 13,"　　salicylic" 17,"　　$o$-anisic" 21) rotate by 45 offset -9,-7
set ylabel "energy (kcal/mol)" font ",14" offset -2,0
set boxwidth 0.5
set xzeroaxis linetype 1 linecolor "black" lw 2
set xrange[-1:23]
array tit[5] = ["$\\Delta_{\\text{A}\\to\\text{B}} G_\\text{soln}$",\
"$\\Delta_{\\text{A}\\to\\text{B}} \\ev{E(\\psi)}_\\text{soln}$",\
"$-T\\Delta_{\\text{A}\\to\\text{B}} S^{\\text{conf}}$",\
"$\\Delta_{\\text{A}\\to\\text{B}}  \\mu^\\text{solv}$",\
"$\\Delta_{\\text{A}\\to\\text{B}}  \\ev{\\nu^\\text{solv}(\\psi)}_\\text{soln}$"]
set key samplen 1.5
set style fill solid 0.8 border  lc rgb "black" 
plot \
"acid.dat" u ($0*4):8 w boxes lw 2 fc rgb "forest-green" title tit[3] at 0.16,0.99,\
'acid.dat' u ($0*4+0.5):7 w boxes lw 2 fc rgb "red" title tit[1] at 0.16,0.9,\
"acid.dat" u ($0*4+1.5):5 w boxes lw 2 fc rgb "cyan" title tit[5] at 0.58,0.9,\
"acid.dat" u ($0*4+1):6 w boxes lw 2 fc rgb "magenta" title tit[4] at 0.58,0.99,\
"acid.dat" u ($0*4+2):3 w boxes lw 2 fc rgb "blue" title tit[2] at 0.96,0.99
