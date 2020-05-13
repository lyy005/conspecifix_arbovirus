#!usr/bin/perl -w
use strict;

die "Usage: perl $0 [gene.list] [output file] [spp list]\n v1.1 output bed file for gggenes" unless (@ARGV == 3);
open (LST, $ARGV[0]) or die "$ARGV[0] $!\n";
my (%hash, %length, %spp);
my @gene_order;
while(<LST>){
       	chomp;
	my $gene = $_;

	push @gene_order, $gene; # record gene order

	open (ALN, $gene) or die "$_ $!\n";
	$/ = ">";
	<ALN>;
	while(<ALN>){
		chomp;
		my @line = split /\n+/, $_;
		my $name = shift @line;
		#my @name = split /\_/, $name; for virus
		my $seq = join "", @line; # for virus
		#$hash{$gene}{$name[0]} = $seq; for virus
		$hash{$gene}{$name} = $seq; # for virus
		$length{$gene} = length($seq);
# print "###$gene\t$length{$gene}\n";
		#$spp{$name[0]} = 1 unless $spp{$name[0]}; for virus
		$spp{$name} = 1 unless $spp{$name}; # for virus
	}
	$/ = "\n";
}
close LST;
my %concate;
my @spp;
open (LST, $ARGV[2]) or die "$ARGV[2] $!\n";
while(<LST>){
	chomp;
	#my @line = split/\_/; for virus
	#push @spp, $line[0]; for virus
	push @spp, $_;
}

my $start = 0;
my $end = 0;
print "Gene\tlength\tstart\tend\n";
#foreach my $k (sort keys %hash){

open OT2, ">$ARGV[1].bed" or die "$ARGV[1].bed $!\n";
print OT2 "molecule\tgene\tstart\tend\tstrand\tdirection\n";

foreach my $k (@gene_order){
	my $gene = $k;
	my @gene1 = split /\./, $k; 
	my @gene2 = split /\_/, $gene1[0];

	$end += $length{$k};
	print "$gene2[1]\t$k\t$length{$k}\t$start\t$end\n";
	print OT2 "genome\t$gene2[1]\t$start\t$end\tforward\t1\n";
	$start = $end + 1;

	foreach my $l (sort keys %spp){
		if($hash{$k}{$l}){
			$concate{$l} .= $hash{$k}{$l};
#			print "$k\t$l\n";
		}else{
			$concate{$l} .= "-" x $length{$k};
			print "$k\t$l\tNot found, fill in gaps\n";

#my $gap = "-" x $length{$k};
#print "$gap\n";
		}
	}
}
open OT, ">$ARGV[1]" or die "$ARGV[1] $!\n";

#foreach my $k (sort keys %concate){
foreach my $k (sort @spp){
	if($concate{$k}){
		print OT ">$k\n$concate{$k}\n";
#print ">$k\n$concate{$k}\n";
	}else{
		print "$k\n";
	}
}

close OT;
print "Output: $ARGV[1].bed\nDONE!\n";
