#!/usr/bin/perl
$file="FELM30.dat";
$nx=200;
$ny=200;
$fileout="M30_d200_200.dat";

open (IN,"<$file");
$xmax=0;$xmin=1000;
$ymax=0;$ymin=1000;
while (<IN>){
        chomp;
        my @line=split;
        if ($line[0] > $xmax ){$xmax =$line[0];}
        if ($line[0] < $xmin ){$xmin =$line[0];}
        if ($line[1] > $ymax ){$ymax =$line[1];}
        if ($line[1] < $ymin ){$ymin =$line[1];}
}
close IN;
$dx=($xmax-$xmin)/$nx;
$dy=($ymax-$ymin)/$ny;
print "
xmax:          $xmax
xmin:          $xmin
dx:        $dx
        
ymax:           $ymax
ymin:           $ymin
dy:         $dy
";

$B=0;
open (OUT,">$fileout");
for (my $x=0;$x<$nx;$x++){
	for (my $y=0;$y<$ny;$y++){
		open (IN,"<$file");
		while (<IN>){
			chomp;
			@line=split;
			if ($line[0] >= $xmin+($x*$dx) && $line[0] < $xmin+($x+1)*$dx){
			if ($line[1] >= $ymin+($y*$dy) && $line[1] < $ymin+($y+1)*$dy){
					$B++;
				}
			}
		}
		close IN;
        	printf OUT ("%10.8f %10.8f %5s\n", $xmin+$x*$dx, $ymin+$y*$dy, $B);
		$B=0;
	}
	print OUT "\n";
}
close OUT;


