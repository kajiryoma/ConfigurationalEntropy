reset


set terminal tikz createstyle color size 110mm,90mm
set output "figure9_plt.tex"
set multiplot
set tics out
set size square 1,1
set margin 0,0,0,0
set size 1,1
set origin 0,0
set border lw 2
set key right bottom maxrow 4 maxcol 1 spacing 1.7 width -4 height 0.3 offset 0,0 noopaque
set yrange[-10:40]
set xrange[-10:40]
set xtics 10 font ",14"
set mxtics 5
set ytics 10 font ",14" offset 1,0
set mytics 5
set ylabel "$-T\\Delta_{\\text{A}\\rightarrow\\text{B}} S^\\text{conf}_\\text{QHA}$ (kcal/mol)"  font ",14" offset -1,0
set xlabel "$-T\\Delta_{\\text{A}\\rightarrow\\text{B}} S^\\text{conf}$ (kcal/mol)" font ",14" offset 0,-0.5
f(x) = x
set key font ",14"
g(x) = a*x + b
a = 1
b = 1
h(x) = c*x + d
c = 1
d = 1

fit g(x) "alkane.dat" using ($8):($9*(-1)) via a,b
fit h(x) "diol.dat" using ($8):($9*(-1)) via c,d
#"$\\Delta S^\\text{conf}=\\Delta_{\\text{A}\\rightarrow\\text{B}}S^\\text{conf}_\\text{QHA}$",\

p \
g(x) w l lw 2  lc rgb "red" notitle ,\
h(x) w l lw 2  lc rgb "blue" notitle ,\
NaN w linespoint lw 3  pt 4 ps 2 lc rgb "red" title "alkane",\
NaN w linespoint lw 3  pt 6 ps 2 lc rgb "blue" title "alkanediol",\
f(x) w l lw 2 dt (2,2) lc rgb "black" notitle,\
"alkane.dat" u ($8):($9*(-1)) w p lw 3 pt 4 ps 2 lc rgb "red" notitle,\
"diol.dat" u ($8):($9*(-1))  w p lw 3 pt 6 ps 2 lc rgb "blue" notitle,\
"acid.dat" u 8:($9*(-1)) w p lw 3 pt 8 ps 3 lc rgb "forest-green" title "carboxylic acid"
set object 10 rect \
    from graph 0,0 to graph 1,1 \
    fc rgb "white" fillstyle solid 1.0 
set size 0.54,0.54
set margin 0,0,0,0
set origin 0.37,0.4

set arrow 1 from -0.374,0.049 to -0.374,1 nohead lw 2
set arrow 2 from -0.374,1 to -0.174,1 nohead lw 2
set label 1 "benzoic" at -0.174,1 offset 0.1,0

set arrow 3 from -0.264,-0.054 to -0.264,0.8 nohead lw 2
set arrow 4 from -0.264,0.8 to -0.064,0.8 nohead lw 2
set label 2 "$o$-toluic" at -0.064,0.8 offset 0.1,0

set label 4 "$o$-anisic" at 0.855,0.673 offset 0,-1
set label 5 "salicylic" at 0.821,0.075 offset 0.2,-1
set label 6 "butanoic" at 0.117,-0.297 offset 0.2,-1
set label 7 "hexanoic" at 0.115,-0.021 offset 0.2,-1
set xrange[-0.6:1.4]

set yrange[-0.6:1.4]
set tics 1
set mxtics 5
unset xlabel
unset ylabel
p \
f(x) w l lw 2 dt (2,2) lc rgb "black" notitle,\
"alkane.dat" u ($8):($9*(-1)) w p lw 3 pt 4 ps 2 lc rgb "red" notitle,\
"diol.dat" u ($8):($9*(-1))  w p lw 3 pt 6 ps 2 lc rgb "blue" notitle,\
"acid.dat" u 8:($9*(-1)) w p lw 3 pt 8 ps 3 lc rgb "forest-green" notitle

