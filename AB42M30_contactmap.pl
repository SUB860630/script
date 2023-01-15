#!/usr/bin/perl 
# if I do not put the abow line then I have to use commend perl to execute the script
$residuenumber=169;
$nsnapshots=25000;

for ($i=1;$i<$residuenumber;$i++){
	for ($j=1;$j<$residuenumber;$j++){
		$contact[$i][$j]=0;
	}
}
for($k=1;$k<=25000;$k++){
	$file="M30T1.pdb.$k";
	
	for ($l=1;$l<=$residuenumber;$l++){
		$sumx[$l]=0;
		$sumy[$l]=0;
		$sumz[$l]=0;
		$natom[$l]=0;
	}

open (FILE,"<$file");# read the r.pdb
while (<FILE>){
		chomp;
		#	print "$_\n"; #print the line itself
		#print "$.\n"; #print the line number ; \n means the line finished
		@line=split(undef,$_); #array generate
		if ($line[0].$line[1].$line[2].$line[3] eq "ATOM"){
                                $n=$line[6].$line[7].$line[8].$line[9].$line[10]; #atom number
                                $pdbatom[$n][1]=$line[32].$line[33].$line[34].$line[35].$line[36].$line[37]; # x axis of atom $n
                                $pdbatom[$n][2]=$line[40].$line[41].$line[42].$line[43].$line[44].$line[45]; # y axis
                                $pdbatom[$n][3]=$line[48].$line[49].$line[50].$line[51].$line[52].$line[53]; # z axis ...
                                $pdbatom[$n][4]=$line[22].$line[23].$line[24].$line[25]; # Residue number ...
				#	$totalatom+=1;
		}
	}

close FILE;


# Subroutine to calculate the distance between two atoms
sub  dist(){
$distance=sqrt(($pdbatom[$_[0]][1]-$pdbatom[$_[1]][1])**2+($pdbatom[$_[0]][2]-$pdbatom[$_[1]][2])**2+($pdbatom[$_[0]][3]-$pdbatom[$_[1]][3])**2);
print "Distance between atom $_[0] and atom $_[1] is:  $distance\n";
}
##############################################################

##############################################################
sub com{
	for (my $i=1;$i<=2509;$i++){
		$sumx[$pdbatom[$i][4]]+=$pdbatom[$i][1]; #xaxis
		$sumy[$pdbatom[$i][4]]+=$pdbatom[$i][2]; #yaxis
		$sumz[$pdbatom[$i][4]]+=$pdbatom[$i][3]; #zaxis
		$natom[$pdbatom[$i][4]]+=1;
	}
}
&com;



for ($i=1;$i<$residuenumber;$i++){
	for ($j=1;$j<$residuenumber;$j++){
		
$var1=$i;
$var2=$j;

$x=$sumx[$var1]/$natom[$var1];
$y=$sumy[$var1]/$natom[$var1];
$z=$sumz[$var1]/$natom[$var1];
$x1=$sumx[$var2]/$natom[$var2];
$y1=$sumy[$var2]/$natom[$var2];
$z1=$sumz[$var2]/$natom[$var2];
$distance = sqrt(($x-$x1)**2+($y-$y1)**2+($z-$z1)**2);
if($distance<=6.5)
{
$contact[$i][$j]++;
}

      }
}

}
##################################################################
open (RESULT,">M30T1contact.dat");
for ($i=1;$i<$residuenumber;$i++){
	for ($j=1;$j<$residuenumber;$j++){
		my $t=$contact[$i][$j]/$nsnapshots*100;
		print RESULT "$i	$j	$t\n";

}
}
close RESULT;




#please make a subroutine to calculate the center of mass of a residue of which residue number is put when you run the script.
