###
# step 1: copying and make file: matrix_sample.txt
###
perl ../../step3_conSpeciFix/simulation_master_script_v1.0_beta/setup_simulation_step1.pl ../../step3_conSpeciFix/template_conspecifix/

###
# NJ tree building
###
BIONJ_linux
# input: matrix_sample.txt
# output: matrix_sample.tree

###
# Simulation using SeqGen
###
# only pick genomens in the sample.txt (maximum to be 100)
pick_sequences_on_list.pl concat85.fa sample.txt sample.concat85.fa

# calculate GC content and length for simulation
length_distribution_V1.4.pl sample.concat85.fa # for length and GC content

# -f flag: #A #C #G #T 
Seq-Gen-1.3.4/source/seq-gen -mGTR -l16297 -n1 -f0.27,0.23,0.29,0.21 -of < matrix_sample.tree > simulation.fasta

# calculate pi for original data and simulation
perl calculate_pi_v0.92.pl sample.concat85.fa sample.concat85.fa.pi
perl calculate_pi_v0.92.pl simulation.fasta simulation.fasta.pi

###
# step 2: rerun conspecifix on simulated data set
perl setup_simulation_step2.pl ../../step3_conSpeciFix/template_conspecifix/

# step 3: rerun conspecifix on simulation data
python child_runner.py
