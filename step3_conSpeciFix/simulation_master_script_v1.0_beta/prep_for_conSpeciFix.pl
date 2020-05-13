#!/usr/bin/perl -w
use strict;

die "usage: perl $0 [simulation.fasta] [output dir]\n" unless (@ARGV == 2);

open IN,$ARGV[0] or die "$!\n";

$/=">";
<IN>;
while (my $line=<IN>) {
	chomp $line;
	my @line = split /\n+/, $line;
	my $name = shift @line;
	my $seq = join "", @line;

	open OUT,">$ARGV[1]/$name\.fa" or die "$!\n";
	print OUT ">gene0\n$seq\n";
	close OUT;
}
close IN;
