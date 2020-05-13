#!/usr/bin/perl -w
use strict;
#use Term::ANSIColor;
#print color 'bold yellow';

die "usage: perl $0 [alignment] [pairwise output]
 v0.93 (1 - pi) is acutually Average Nucleotide Identity (ANI). So the script is renamed. The algorithm is the same. We calculate the average shared region between genomes and calculate the identity in the shared regions.
 v0.92 with species information in the 5th column \n v0.91 uses gaps to calculate shared region and ignore gaps in calculating pi \n v0.9 takes gaps into account\n" unless (@ARGV == 2);

open IN,$ARGV[0] or die "$!\n";
open OUT,">$ARGV[1]" or die "$!\n";

my (@seq, @name, $seq);

$/=">";
<IN>;

while (my $line = <IN>) {
	chomp $line;
	my @line = split /\n+/, $line;	

	my $name = shift @line; 
	$seq = join "", @line;

	push @seq, $seq;
	push @name, $name;
}
close IN;


my ($pseudo_tot, $total, $share_tot);
my $length = length ($seq);

print "Alignment length: $length\n";

print OUT "seq1\tseq2\tshare\tsimi\tspp\n";
for (my $i = 0; $i <= $#seq; $i ++){
	for (my $j = $i + 1; $j <= $#seq; $j ++){
		#my $count = ( $seq[$i] ^ $seq[$j] ) =~ tr/\0//c;
		my @seq1 = split /\s*/, $seq[$i];
		my @seq2 = split /\s*/, $seq[$j];
		
		my $both_gaps = 0;
		my $not_share = 0; 					# shared region bewteen two sequences
		my $count = 0;						# count difference between two sequences, ignoring any non-ATCG basepairs
		
		for (my $a = 0; $a <= $#seq1; $a ++){
			if(($seq1[$a] =~ /-/)&&($seq2[$a] =~ /-/)){	# ignore gaps found in both sequences
				$both_gaps ++;
				#print "!!! $seq1[$a] $seq2[$a]\n";
			}elsif(($seq1[$a] =~ /-/)||($seq2[$a] =~ /-/)){
				$not_share ++;
				#print "### $seq1[$a] $seq2[$a]\n";
			}elsif($seq1[$a] eq $seq2[$a]){  		# calculate same basepairs between two sequences
				$count ++;
			}
		}
		my $share = ($length - $not_share) / $length;
		my $pseudo_pi = $count / ($length - $not_share - $both_gaps);

		$share_tot += $share;
		$pseudo_tot += $pseudo_pi;
		$total ++; 

		my @spp1 = split /\-/, $name[$i];
		my @spp2 = split /\-/, $name[$j];

		my @combined;
		push @combined, $spp1[0];
		push @combined, $spp2[0];

		@combined = sort @combined;
		my $combined = join "\-", @combined;
		print OUT "$name[$i]\t$name[$j]\t$share\t$pseudo_pi\t$combined\n";
	}
}
my $share_avg = $share_tot / $total;;
my $pseudo_avg = $pseudo_tot / $total;
print "Average shared region: $share_avg\nTotal similarity (1-pi): $pseudo_tot\nNumber of pairwise comparisions: $total\nOverall pseudo average similarity = $pseudo_avg\n";

