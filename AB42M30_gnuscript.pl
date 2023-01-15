#!/usr/bin/gnuplot
reset
set encoding utf8
set term png
set output "M30T1contact.png"
#set output "cudmpccontact.png"
set mxtics 10 
set mytics 10
set cbtics font "Times-Roman,18" offset -1
set xtics font "Times-Roman,20"
set ytics font "Times-Roman,20" offset 1
#set title "A{/symbol b}_{1-42}" font "Times-Roman,40"
set title "A{/symbol b}_{1-42}-M30" font "Times-Roman,40"
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
#set xtics nomirror
#set xtics mirror ("D" 1, "A" 2, "E" 3, "F" 4, "R" 5, "H" 6, "D" 7, "S" 8, "G" 9, "Y" 10, "E" 11, "V" 12, "H" 13, "H" 14, "Q" 15, "K" 16, "L" 17, "V" 18, "F" 19, "F" 20, "A" 21, "E" 22, "D" 23, "V" 24, "G" 25, "S" 26, "D" 27, "K" 28, "G" 29, "A" 30, "I" 31, "I" 32, "G" 33, "L" 34, "M" 35, "V" 36, "G" 37, "G" 38, "V" 39, "V" 40, "I" 41, "A" 42)
#set ytics mirror
#set ytics mirror ("D" 1, "A" 2, "E" 3, "F" 4, "R" 5, "H" 6, "D" 7, "S" 8, "G" 9, "Y" 10, "E" 11, "V" 12, "H" 13, "H" 14, "Q" 15, "K" 16, "L" 17, "V" 18, "F" 19, "F" 20, "A" 21, "E" 22, "D" 23, "V" 24, "G" 25, "S" 26, "D" 27, "K" 28, "G" 29, "A" 30, "I" 31, "I" 32, "G" 33, "L" 34, "M" 35, "V" 36, "G" 37, "G" 38, "V" 39, "V" 40, "I" 41, "A" 42)
#set xtics format "{/:Bold {/=12 %.0s}}"
#set ytics format "{/:Bold {/=12 %.0s}}"
set xtics in
set ytics in
#set ytics rotate
#set size 1,1
#splot "cudmpccontact.dat" u 1:2:3
splot "M30T1contact.dat" u 1:2:3

