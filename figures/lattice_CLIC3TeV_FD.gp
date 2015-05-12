set term postscript enhanced color 20 solid
set output 'lattice_CLIC_3TeVFD.eps'

# Set axis labels and tics and ranges
set xlabel 's [m]'
set ylabel '{/Symbol b} [10^5 m]'
set y2label '{/Symbol b}_y/{/Symbol b}_x'
#set y2tics 0.05
set xrange [-15:]
#set xrange [0:2800]
set ytics nomirror
#set yrange [0:1400]
#set y2range [-30:40]
set y2tics 10
set ytics 1
#set xtics 1


# Legend configuration
set key left
set key spacing 3.5

set multiplot

# twiss functions plots #

s0 = 2795.935288

set size 1.0,0.8

set obj 1 rect from -6.24,graph 0 to -3.5,graph 1 fc lt 0 fs solid 0.15 noborder 
#set obj 2 rect from -6.24,graph 0 to -1.0,graph 0.26 fc lt 0 fs solid 0.25 noborder 
p 'CLIC3TeVnewbds.twiss' u ($2-s0):($3/1e5) smooth csplines lw 2 lt 7 t '{/Symbol b}_x',\
 '' u ($2-s0):($4/1e5) smooth csplines lw 2 lt 1 t '{/Symbol b}_y' , \
'' u ($2-s0):($4/$3) smooth csplines lw 2 lt 2 t '{/Symbol b}_y/{/Symbol b}_x' axes x1y2 

# Set to fit with the plot

set size 1.04,0.15
set origin -0.065,0.75

# unset plot parameters
unset object 2

unset xtics
unset xlabel
unset ytics
unset y2tics

#unset xrange 
set yrange [-1.3:1.3]
set xrange [:0]
set xzeroaxis 
set style fill solid
unset ylabel
unset y2label

unset key
set lmargin 10
set rmargin 8
set zeroaxis

# Elements on the to plot #
# 8 -> angle
# 6 -> k1l
# 7 -> k2l

p '< grep -i SBEND CLIC3TeVnewbds.twiss' u ($2-s0):($8 != 0 ? -0.5:1/0):($10) w boxes axis x1y1 lt 3 lw 1,\
  '< grep -i SBEND CLIC3TeVnewbds.twiss' u ($2-s0):($8 != 0 ? 0.5:1/0):($10) w boxes axis x1y1 lt 3 lw 1,\
  '< grep -i QUADRUPOLE CLIC3TeVnewbds.twiss' u ($2-s0-$10/2):($6/abs($6)):($10) w boxes axis x1y1 lt 1 lw 1
#  '< grep -i SEXTUPOLE CLIC3TeVnewbds.twiss' u ($2):($7/abs($7)):($10) w boxes axis x1y1 lt 0 lw 1
