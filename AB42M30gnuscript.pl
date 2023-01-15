#!/usr/bin/gnuplot
        reset
        set encoding utf8
	set term png
        set samples 500,500
        set isosamples 500,500
        set output "M30_FEL.png"
	#set output "test.png"
	#set border 12 
	set yrange [13.7:14.3 ]
        #set yrange [9.3:9.5 ]
	set ytics offset 1, 0
	set ytics font "Time-Roman,18"
        set encoding iso_8859_1 # to write Angstrom
        set ylabel "Rg (\305) \n\n" offset -1  font "Time-Roman,18"# textcolor rgb "blue"
        set xrange [0.7:3.5]
	#set xrange [11.8:12.2]
	#set cbtics ("5" 0.0, "4" 0.2, "3" 0.4, "2" 0.6, "1" 0.8, "0" 1.0)
        set xtics font "Time-Roman,20"
        set xlabel "RMSD  ({\305}) \n\n" font "Time-Roman,18"
	#set palette rgbformulae 33,13,10
        set cbrange[0:8]
        set cbtics font "Time-Roman,18"
	set palette defined (0 "brown", 0.3 "orangered4", 0.6 "red", 2 "yellow", 3 "cyan", 4 "dark-blue", 4.5 "medium-blue", 5 "navy", 8 "white")
        set lmargin at screen 0.16
        set rmargin at screen 0.78
        set bmargin at screen 0.2
        set tmargin at screen 0.9
        set cblabel "\n Free energy (kcal/mol)" offset 1 font "Time-Roman,18" 
        set cbtics format "%1.1f"
        set pm3d interpolate 0,0
        set pm3d map
        set surface
        splot 'M30DELG.dat' u 1:2:3 notitle
