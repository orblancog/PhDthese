set term postscript enhanced color 20 solid
set output 'lattice_CLIC_3TeV_trad_int_beta.eps'

# Set axis labels and tics and ranges
set xlabel 's [m]'
set ylabel '{/Symbol b}^{1/2}[m^{1/2}]'
set y2label '{/Symbol h}_x [mm]'
set y2tics 0.05
set xrange [-10:1550]
set ytics nomirror
#set yrange [0:1400]
set y2range [-30:40]
set y2tics 10

# Legend configuration
set key left
set key spacing 3.5

set multiplot

# twiss functions plots #

set size 1,0.8
p 'twiss_trad_beta_int.dat' u 2:(sqrt($3)) w l lw 2 lt 7 t '{/Symbol b}_x^{1/2}',\
 '' u 2:(sqrt($4)) w l lw 2 lt 1 t '{/Symbol b}_y^{1/2}' , \
'' u 2:($5*1000) w l lw 2 lt 2 t '{/Symbol h}_x' axes x1y2 

# Set to fit with the plot

set size 0.985,0.15
set origin -0.013,0.75

# unset plot parameters

unset xtics
unset xlabel
unset ytics
unset y2tics

set yrange [-1.3:1.3]
set xzeroaxis lt -10
set style fill solid
unset ylabel
unset y2label

unset key
set lmargin 10
set rmargin 8
set zeroaxis

# Elements on the to plot #
# 11 -> angle
# 12 -> k1l
# 13 -> k2l

p 'twiss_trad_beta_int.dat' u 2:(($8/$8)-0.5) w i axis x1y1 lt 3 lw 45,\
  '' u 2:((-$8/$8)+0.5) w i axis x1y1 lt 3 lw 45,\
  '' u 2:($6/abs($6)) w i axis x1y1 lt 1 lw 2,\
  '' u 2:($7/abs($7)) w i axis x1y1 lt 7 lw 2
  
