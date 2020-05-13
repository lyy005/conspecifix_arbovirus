#!/usr/bin/perl -w
use strict;
#use Term::ANSIColor;
#print color 'bold yellow';

die "usage: perl $0 [ contig file ] [cutoff (optional)]\n * V1.3 Added L50 and L90\n * V1.2 Added GC content\n" unless (@ARGV>=1);
my $cutoff;
if(defined $ARGV[1]){
	$cutoff = $ARGV[1];
}else{
	$cutoff = 0;
}

open IN,$ARGV[0] or die "$!\n";
open OUT,">$ARGV[0].length" or die "$!\n";
open GC,">$ARGV[0].gc" or die "$!\n";
my ($head, $seq, $line, @line, @len_1, @len_2, @len_3, @len_4, @tot, @min, @N90, @N50, @avg, @max, @L90, @L50);
my ($tot_gc, $tot_at);

my $count = 0;
my $count_2 = 0;
$/=">";<IN>;$/="\n";

print GC "ID\tGC_counts\tGC_content\n";
while ($line=<IN>) {
        $count ++;
        @line=split(/\s+/,$line);
        my $head=$line[0];
        chomp $head;        

        $/=">";
        my $seq = <IN>;
        chomp $seq;
        $seq =~ s/\s+//g;
        my $len_1 = length($seq);
	push @len_1, $len_1;
        $seq =~ s/N//g;
	$seq =~ s/x//g;
	$seq =~ s/\-//g;
        my $len_2 = length($seq);
        push @len_2, $len_2;

	my $gc = ($seq=~tr/GCgc/GCgc/);
	my $at = ($seq=~tr/ATat/ATat/);
	my $ratio = $gc / ($gc + $at);

	print GC "$head\t$gc\t$at\t$ratio\n";
	$tot_gc += $gc;
	$tot_at += $at;

	print OUT "$head\t$len_1\t$len_2\n";
	$/="\n";

	if($len_1 >= $cutoff){
		$count_2 ++;
		push @len_3, $len_1;
		push @len_4, $len_2;
	}
}
&Cal(@len_1);
&Cal(@len_2);
&Cal(@len_3);
&Cal(@len_4);

my $tot_ratio = $tot_gc / ($tot_gc + $tot_at);
my $tot_at_ratio = 1 - $tot_ratio;

print "GC content: $tot_ratio\tAT content: $tot_at_ratio\n";
print "Reads_number: Total_reads: $count\tReads>=$cutoff\_bp: $count_2\n\n";
print "\tLength_(with_N)\tLength_(no_N)\t>=$cutoff\_(with_N)\t>=$cutoff\_(no_N)\n";
my $tot = join "\t", @tot;
print "Total\t$tot\n";
my $min = join "\t\t", @min;
print "Min\t$min\n";
my $N90 = join "\t\t", @N90;
print "N90\t$N90\n";
my $avg = join "\t\t", @avg;
print "Avg\t$avg\n";
my $N50 = join "\t\t", @N50;
print "N50\t$N50\n";
my $max = join "\t\t", @max;
print "Max\t$max\n";

my $L50 = join "\t\t", @L50;
print "L50\t$L50\n";

my $L90 = join "\t\t", @L90;
print "L90\t$L90\n";

##
# Subroutines
##
# Maximum, Minimum, Average length, Total length
sub Cal{
	my @len = @_ ;
#print "@_\n";
	my @cal = sort {$b <=> $a} @len;
#print "@cal\n";
	my $count = @len;
	my ($tot);
	my $cal = 0;
	my $N50 = 0;
	my $N90 = 0;

	my $L50 = 0; # new feature
	my $L90 = 0; # new feature
	my $count2 = 0;

	foreach my $k (@cal){
		$tot += $k;
	}

	foreach my $k (@cal){
		$cal += $k;
		$count2 ++;

	        if(($N50 == 0)&&($cal > 0.5*$tot)){
	                $N50 = $k;
			$L50 = $count2;
        	}

	        if(($N90 == 0)&&($cal > 0.9*$tot)){
        	        $N90 = $k;
			$L90 = $count2;
	        }

	}

	my $avg = sprintf("%.2f", ($tot/$count));

	my $min = $cal[-1];
	my $max = $cal[0];
	push @tot, $tot;
	push @min, $min;
	push @N90, $N90;
	push @N50, $N50;
	push @avg, $avg;
	push @max, $max;

	push @L90, $L90;
	push @L50, $L50;
}
