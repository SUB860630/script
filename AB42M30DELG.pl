#!/usr/bin/perl
$file="M30_d200_200.dat";
$max_population=67;
$T=310;

open (PO,"<$file");
while (<PO>)
	{
	chomp;
	@line=split;
	if (/^\s*$/){print "\n";}
	 elsif ($line[2] eq 0) {printf ("%10.4f %10.4f %10.4f\n",$line[0],$line[1],-0.0019872041*$T*(log(0.0001)-log($max_population)));} 
	 else {printf ("%10.4f %10.4f %10.4f\n",$line[0],$line[1],-0.0019872041*$T*(log($line[2])-log($max_population)));}
         }
close PO;


