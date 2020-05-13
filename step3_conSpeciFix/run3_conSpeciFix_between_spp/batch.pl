#!/usr/bin/perl -w
use strict;

die "usage: perl $0 [fasta list]\n" unless (@ARGV == 1);

my @gene_list;
my %genome_count;

print "Step 0: Parse fasta files\n\nStrains:\n";
open IN,$ARGV[0] or die "$!\n";
while (my $line = <IN>) {
	next if($line =~ /^#/);
# step 1: get gene names
## 1A.fasta
	chomp $line; 
	my @line = split /\./, $line;
	push @gene_list, $line[0];

# step 2: count the number of sequences in each genome
	open FA, $line or die "$!\n";
	$genome_count{$line[0]} = 0;
	while(<FA>){
		$genome_count{$line[0]} ++ if(/^>/);
	}
	close FA;
	print "## Strains: $line[0]\t Genomes: $genome_count{$line[0]}\n";
}
close IN;

# step 3: loop thro all the combinations
for (my $i = 0; $i <= $#gene_list; $i ++){

# step 3.1: for each single strains, also run conspecifix
	print "\n###########\nStep 1: Making single species conSpeciFix runs\n";
	if($genome_count{$gene_list[$i]} >= 10){
		print "## Making folder: $gene_list[$i]\n\n";
		`mkdir $gene_list[$i]`;

		print "#### Making scripts in: $gene_list[$i]\n\n";
		open OT, ">./$gene_list[$i]/cmd.sh" or die "$!\n";
		print OT "cat ../$gene_list[$i].fasta > ./simulation.fasta
perl ../simulation_master_script_v1.0_beta/setup_simulation_step1.pl ../template_conspecifix/
perl setup_simulation_step2.pl ../template_conspecifix\n";
		close OT;	
	}else{
		print "## Not enough sequences: $gene_list[$i]\n\n";
	}


	for (my $j = $i + 1; $j <= $#gene_list; $j ++){

	print "Step 2: Making between species conSpeciFix runs\n";
# step 4: pick different species with 1 genome
		my ($file1, $file2);
		if($genome_count{$gene_list[$i]} >= 10){
			$file1 = $gene_list[$i]."x".$gene_list[$j];
			print "## Making folder: $file1\n";
			`mkdir $file1`;

# step 5: put shell script in the folder
			open OT, ">./$file1/cmd.sh" or die "$!\n";
			print "#### Making scripts in: $file1\n\n";
			print OT "cat ../$gene_list[$i].fasta ../$gene_list[$j].fasta > ./old_simulation.fasta
perl ../pick_random_spp.pl old_simulation.fasta $gene_list[$j] simulation.fasta
perl ../simulation_master_script_v1.0_beta/setup_simulation_step1.pl ../template_conspecifix/
perl setup_simulation_step2.pl ../template_conspecifix\n";
			close OT;
		}else{
			$file1 = $gene_list[$i]."x".$gene_list[$j];
			print "## Not enough genomes for $gene_list[$i]. Could't make folder: $file1\n";
		}
		
		if($genome_count{$gene_list[$j]} >= 10){
			$file2 = $gene_list[$j]."x".$gene_list[$i];
			print "## Making folder: $file2\n";
			`mkdir $file2`;

			open OT, ">./$file2/cmd.sh" or die "$!\n";
			print "#### Making scripts in: $file2\n\n";
			print OT "cat ../$gene_list[$i].fasta ../$gene_list[$j].fasta > ./old_simulation.fasta
perl ../pick_random_spp.pl old_simulation.fasta $gene_list[$i] simulation.fasta
perl ../simulation_master_script_v1.0_beta/setup_simulation_step1.pl ../template_conspecifix/
perl setup_simulation_step2.pl ../template_conspecifix\n";
			close OT;
		}else{
			$file2 = $gene_list[$j]."x".$gene_list[$i];
			print "## Making folder: $file2\n";
			print "#### Not enough genomes for $gene_list[$j]\n\n";
		}

	}
}
