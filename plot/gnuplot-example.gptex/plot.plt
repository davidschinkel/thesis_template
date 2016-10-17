
define_margins = 1

load '../default.plt'

set title 'This example was generated using GnuPlot with \LaTeX'

set xlabel '$x$'
set ylabel '$y$'

set xrange [0:10]
set yrange [0:10]

plot  'data.dat' with image, \
'contours.dat' index 1 with lines linecolor rgb "red", \
'contours.dat' index 3 with lines linecolor rgb "green", \

