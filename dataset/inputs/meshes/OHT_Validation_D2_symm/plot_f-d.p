# Gnuplot script file for plotting data f-d curve
# Created by G.Guillamet <gerard.guillamet@bsc.es>
set   autoscale                        # scale axes automatically
unset log                              # remove any log-scaling
unset label                            # remove any previous labels
set xtic auto                          # set xtics automatically
set ytic auto                          # set ytics automatically
set xlabel "Displacement (mm)"
set ylabel "Load (kN)"
set xr [0:0.5]
set yr [0:30.0]
set key right top
set grid
set size square
#
# define line styles using explicit rgbcolor names
#
set style line 1 lt 1 lc rgb "black" lw 1.7
set style line 2 lt 1 lc rgb "red" lw 1.7
set style line 3 lt 1 lc rgb "blue" lw 1.7

caseName = "OHT_Validation_D2"
pathJobFile = caseName

plot "./base/1p/experiment.txt" using (1*$1):(1e-3*$2) title 'Experiment' with lines ls 1, \
     "./base/1p/Abaqus-".caseName.".txt" using (1*$1):(1e-3*$2) title 'ABAQUS' with lines ls 2, \
     pathJobFile."-reaction.sld.res" using (1*$3):(2e-3*$6) title 'ALYA' with lines ls 3
