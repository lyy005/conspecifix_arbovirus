#!/usr/bin/perl -w
use strict;
use Cwd;

my $abs_dir = getcwd;
print "Working directory: $abs_dir\n\n";
#my $abs_path = abs_path($file);

die "usage: perl $0 [ output directory of previous run ]\n # for example: ../template_conspecifix\n" unless (@ARGV == 1);

my $dir = $ARGV[0];

print "Step A: make directories\n";
`mkdir simulation`;
`mkdir simulation/_conspecifix`;
`mkdir simulation/_conspecifix/database`;
`mkdir simulation/_conspecifix/database/User_spec`;
`mkdir simulation/_conspecifix/database/User_spec/genes`;

print " - running: copy the modified scripts: cp -r ../simulation_master_script_v1.0_beta/scripts ./simulation/_conspecifix/ \n";
`cp -r ../simulation_master_script_v1.0_beta/scripts ./simulation/_conspecifix/`;

print "Step B: copy previous files\n";
print " - Running: cp simulation.fasta ./simulation/_conspecifix/database/User_spec\n";
#print " - Running: cp $dir/criterion.txt ./simulation/_conspecifix/database/User_spec\n";

`cp simulation.fasta simulation/_conspecifix/database/User_spec/concat85.fa`;
#`cp -r $dir/genes simulation/_conspecifix/database/User_spec`;
#`cp $dir/database/User_spec/criterion.txt ./simulation/_conspecifix/database/User_spec/`;

# copying R scripts for plotting
print "Step C: copy R scripts to the output directory\n";
`cp ../simulation_master_script_v1.0_beta/*.R ./simulation/_conspecifix/database/User_spec/`;
`cp ../simulation_master_script_v1.0_beta/*.R ./simulation/_conspecifix/database/User_spec/`;
`cp $dir/database/User_spec/graph.txt ./simulation/_conspecifix/database/User_spec/old_graph.txt`;
`cp $dir/database/User_spec/graph_points.txt ./simulation/_conspecifix/database/User_spec/old_graph_points.txt`;
`mkdir ./simulation/_conspecifix/database/User_spec/maps`;

# remake config.py
print "Step D: remaking config.py\n";

open IN, "./template_config.py" or die "./template_config.py $!\n";
open OUT,">./simulation/_conspecifix/scripts/database/config.py" or die "./simulation/_conspecifix/scripts/database/config.py $!\n";

while (<IN>){
	if(/PATH_TO_OUT \= \"\"/){
		s/PATH_TO_OUT = \"\"/PATH_TO_OUT = \"$abs_dir\/simulation\/_conspecifix\/database\"/;
		print OUT;
		print;
	}else{
		print OUT;
	}
}
close IN;
close OUT;
