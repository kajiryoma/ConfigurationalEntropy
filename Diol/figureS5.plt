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
set margin 7,1,1,5

set tics out

set yrange[-10.4:-8.4]
set xrange[0:150]
set ytics 1 offset 1,0
set mytics 5
set tics font ",11"
set xtics 50
set mxtics 2
set ylabel "energy (kcal/mol)" font ",15" offset -1,-25
set style fill solid 0.8 noborder
set multiplot layout 4,3 spacing 0.2
array tit[6] = ["$\\mu^\\text{solv}_\\text{A}$","$\\mu^\\text{solv}_\\text{B}$","$\\ev{\\nu^\\text{solv}(\\psi)}_\\text{soln,A}$","$\\ev{\\nu^\\text{solv}(\\psi)}_\\text{soln,B}$","$\\ev{\\nu^\\text{solv}(\\psi)}_\\text{iso}$","Flexible BAR"]
set title "1,4-butanediol" font ",15" offset 0,-0.5
plot "04diol/a.dat" u 1:5 every ::0::200 w l dt (0.5,1.5) lw 4 lc rgb "red" title tit[3] at 0.41,1 ,\
     "04diol/b.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "blue" title tit[4] at 0.91,1,\
     "04diol/a.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "red" title tit[1] at 0.12,1,\
     "04diol/b.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "blue" title tit[2] at 0.62,1
unset ylabel
set yrange[-9.6:-7.6]
set title "1,5-pentanediol" font ",15" offset 0,-0.5
plot "05diol/a.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "red" notitle ,\
     "05diol/b.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "blue" notitle ,\
     "05diol/a.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "red" notitle,\
     "05diol/b.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "blue" notitle
set yrange[-9.8:-7.8]
set title "1,6-hexanediol" font ",15" offset 0,-0.5
plot "06diol/a.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "red" notitle  ,\
     "06diol/b.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "blue" notitle ,\
     "06diol/a.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "red" notitle,\
     "06diol/b.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "blue" notitle 
set yrange[-10.4:-8.4]
set title "1,7-heptanediol" font ",15" offset 0,-0.5
plot "07diol/a.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "red" notitle  ,\
     "07diol/b.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "blue" notitle ,\
     "07diol/a.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "red" notitle,\
     "07diol/b.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "blue" notitle 
set yrange[-10.4:-8.4]
set title "1,8-octanediol" font ",15" offset 0,-0.5
plot "08diol/a.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "red" notitle  ,\
     "08diol/b.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "blue" notitle ,\
     "08diol/a.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "red" notitle,\
     "08diol/b.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "blue" notitle 
set yrange[-9.6:-7.6]
set title "1,9-nonanediol" font ",15" offset 0,-0.5
plot "09diol/a.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "red" notitle  ,\
     "09diol/b.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "blue" notitle ,\
     "09diol/a.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "red" notitle,\
     "09diol/b.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "blue" notitle 
set yrange[-10.2:-8.2]
set title "1,10-decanediol" font ",15" offset 0,-0.5
plot "10diol/a.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "red" notitle  ,\
     "10diol/b.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "blue" notitle ,\
     "10diol/a.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "red" notitle,\
     "10diol/b.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "blue" notitle 
set yrange[-9.2:-7.2]
set title "1,11-undecanediol" font ",15" offset 0,-0.5
plot "11diol/a.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "red" notitle  ,\
     "11diol/b.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "blue" notitle ,\
     "11diol/a.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "red" notitle,\
     "11diol/b.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "blue" notitle
set yrange[-8.4:-6]
set title "1,12-dodecanediol" font ",15" offset 0,-0.5
plot "12diol/a.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "red" notitle  ,\
     "12diol/b.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "blue" notitle ,\
     "12diol/a.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "red" notitle,\
     "12diol/b.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "blue" notitle
set yrange[-8.8:-6.8]
set title "1,13-tridecanediol" font ",15" offset 0,-0.5
plot "13diol/a.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "red" notitle  ,\
     "13diol/b.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "blue" notitle ,\
     "13diol/a.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "red" notitle,\
     "13diol/b.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "blue" notitle
set yrange[-9.4:-7.2]
set xlabel "$N$" font ",15" offset 0,-1
set title "1,14-tetradecanediol" font ",15" offset 0,-0.5
plot "14diol/a.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "red" notitle  ,\
     "14diol/b.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "blue" notitle ,\
     "14diol/a.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "red" notitle,\
     "14diol/b.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "blue" notitle
set yrange[-8.8:-6.8]
unset xlabel
set title "1,14-pentadecanediol" font ",15" offset 0,-0.5
plot "15diol/a.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "red" notitle  ,\
     "15diol/b.dat" u 1:5 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "blue" notitle ,\
     "15diol/a.dat" u 1:2 every ::0::200 w l lw 4 lc rgb "red" notitle,\
     "15diol/b.dat" u 1:2 every ::0::200 w l lw 4 dt (0.5,1.5) lc rgb "blue" notitle

