#!/usr/bin/perl -w
use strict;

die "usage: perl $0 [ output directory of previous run ]\n # for example: ../template_conspecifix\n" unless (@ARGV == 1);

my $dir = $ARGV[0];

print "##########\n# ";
print "Step A: copying files from previous run: RAxML_distances.dist, sample.txt, concat85.fa\n";
print " - running: cp $dir/database/User_spec/RAxML_distances.dist ./\n";
print " - running: cp $dir/database/User_spec/sample.txt ./\n";
print " - running: cp $dir/database/User_spec/concat85.fa ./\n";

`cp $dir/database/User_spec/RAxML_distances.dist ./`;
`cp $dir/database/User_spec/sample.txt ./`;
`cp $dir/database/User_spec/concat85.fa ./`;

print "\n##########\n# ";
print "Step B: copying master scritps\n";
print " - running: cp ../simulation_master_script_v1.0_beta/\* ./";
`cp ../simulation_master_script_v1.0_beta/*pl ./`;
`cp ../simulation_master_script_v1.0_beta/*R ./`;
`cp ../simulation_master_script_v1.0_beta/*py ./`;

print "\n##########\n# ";
print "Step C: converting RAxML 3 column distance to PHYLIP matrix. Output file: matrix_sample.txt\n";
print " - running: python RAxML2phylip.py\n";
`python RAxML2phylip.py`;
