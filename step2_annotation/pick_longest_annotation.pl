#!/usr/bin/perl -w
use strict;

die "perl $0 [fasta] [output]\n" unless @ARGV == 2;

my (%hash, %len);
open (IN, "$ARGV[0]") or die "$ARGV[0] $!\n";
open (OT, ">$ARGV[1]") or die "$ARGV[1] $!\n";

$/=">";
<IN>;
while(<IN>){
	chomp;
	my $line = $_; 
	my @line = split /\n+/, $line;
	my $name = shift @line;
$name =~ s/NC_/NC/;
	my $seq = join "", @line;
	my $seq_len = length ($seq);

	my @name = split /\s+/, $name;
	

	if($hash{$name[0]}){
		if($seq_len > $len{$name[0]}){
			$hash{$name[0]} = ">".$name."\n".$seq."\n";
			$len{$name[0]} = length ($seq);
		}
	}else{
		$hash{$name[0]} = ">".$name."\n".$seq."\n"; 
		$len{$name[0]} = length ($seq);
	}
}

foreach my $k (sort keys %hash){
	print OT "$hash{$k}";
}
