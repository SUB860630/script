#!/usr/bin/gnuplot
reset
set encoding utf8
set term png
set output "ABT1contact.png"
set mxtics 10 
set mytics 10
set cbtics font "Times-Roman,18" offset -1
set xtics font "Times-Roman,20"
set ytics font "Times-Roman,20" offset 1
set title "A{/symbol b}_{1-42}" font "Times-Roman,40"
set xrange [0.98:168]
set yrange [0.98:168]
set xlabel "Residue number" font "Times-Roman,20"
set ylabel "Residue number" font "Times-Roman,20"
set pm3d map
set palette color
set pal maxcolor 128
set cbrange [0:100] 
set palette model RGB defined (0 "dark-blue", 10 "web-blue", 15 "cyan", 40 "green", 60 "yellow", 80 "orange", 100 "red") 
set autoscale fix
set xtics in
set ytics in
splot "ABT1contact.dat" u 1:2:3

