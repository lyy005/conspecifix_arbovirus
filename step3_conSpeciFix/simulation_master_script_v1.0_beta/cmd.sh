###
# step 1: copying and make file: matrix_sample.txt
###
#perl /stor/work/Ochman/yli19/projects/conSpeciFix/step3_Flaviviruses/simulation/step0_simulation_master_script_v0.9/setup_simulation_step1.pl /stor/work/Ochman/yli19/projects/conSpeciFix/step3_Flaviviruses/runs/run15_USUV/_conspecifix/
perl /stor/work/Ochman/yli19/projects/conSpeciFix/step3_Flaviviruses/simulation/step0_simulation_master_script_v1.0/setup_simulation_step1.pl /stor/work/Ochman/yli19/projects/conSpeciFix/step3_Flaviviruses/runs/run18c_WNV_1000and0.05/_conspecifix/
###
# NJ tree building
###
/stor/work/Ochman/yli19/projects/conSpeciFix/step3_Flaviviruses/simulation/step1_nj_tree/BIONJ_linux
# input: matrix_sample.txt
# output: matrix_sample.tree

###
# Simulation using SeqGen
###

# only pick genomens in the sample.txt (maximum to be 100)
/stor/work/Ochman/yli19/bin/scripts/pick_sequences_on_list.pl concat85.fa sample.txt sample.concat85.fa

# calculate GC content and length for simulation
/stor/work/Ochman/yli19/bin/scripts/length_distribution_V1.3.pl sample.concat85.fa # for length and GC content

# -f flag: #A #C #G #T 
/stor/work/Ochman/yli19/projects/conSpeciFix/step3_Flaviviruses/simulation/Seq-Gen-1.3.4/source/seq-gen -mGTR -l10290 -n1 -f0.24,0.26,0.26,0.24 -of < matrix_sample.tree > simulation.fasta
# with scaling
/stor/work/Ochman/yli19/projects/conSpeciFix/step3_Flaviviruses/simulation/Seq-Gen-1.3.4/source/seq-gen -mGTR -l11298 -n1 -f0.25,0.25,0.25,0.25 -of -s1.75 < matrix_sample.tree > simulation.fasta

# calculate pi for original data and simulation
perl calculate_pi_v0.92.pl sample.concat85.fa sample.concat85.fa.pi
perl calculate_pi_v0.92.pl simulation.fasta simulation.fasta.pi

###
# step 2: rerun conspecifix on simulated data set
perl setup_simulation_step2.pl 
