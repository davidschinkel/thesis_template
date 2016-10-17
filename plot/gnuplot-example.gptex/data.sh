#!/bin/bash

# this script is used to prepare the data for the plot, which may have to be aquired from external sources
# this example will just compute some data using gnuplot

echo "
set table 'data.dat'
set samples 100
set isosamples 100
set xrange[0:10]
set yrange[0:10]
splot sin(x)*cos(y)
" | gnuplot

