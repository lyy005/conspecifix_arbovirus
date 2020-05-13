#!/usr/bin/perl -w
use strict;

die "usage: perl $0 [old simulation file] [spp name to random] [output]\n" unless (@ARGV == 3);

open IN,$ARGV[0] or die "$!\n";
open OUT,">$ARGV[2]" or die "$!\n";

my $spp = $ARGV[1];

$/=">";
<IN>;

my @keep;
my @random;
while (my $line = <IN>) {
	chomp $line;
	my @line = split /\n+/, $line;

	if($line[0] =~ /$spp/){
		push @random, $line;
	}else{
		push @keep, $line;
	}
}
close IN;

print OUT ">$random[int rand (@random)]";

foreach my $k (@keep){
	print OUT ">$k";
}
