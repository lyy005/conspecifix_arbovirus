#!/usr/bin/perl -w
use strict;

die "perl $0 [fasta] [new name] [output file]\n" unless @ARGV == 3;

my $new_name = $ARGV[1];

open (IN, "$ARGV[0]") or die "$ARGV[0] $!\n";
open (OUT, ">$ARGV[2]") or die "$ARGV[2] $!\n";
$/=">";
<IN>;
while(<IN>){
	chomp;
	my $all = $_;
	my @line = split /\n+/;
	my $id = shift @line;
	my $seq = join "", @line;
	
	my @id = split /\-+/, $id;

	print OUT ">$new_name\-$id[1]\n$seq\n";
}
close IN;
