# running conspecifix to pick 100 representative genomes
# below is an example using ZIKV genomes
less -S ../step1_genomes_and_ref_proteins/flaviruses/ZIKV/concate.list.fasta | perl -e 'while(<>){ if(/>(\w+)\|/){ print ">$1\n"}else{print} }' > simulation.fasta

# set up conSpeciFix files
perl ../simulation_master_script_v1.0_beta/setup_simulation_step1.pl ../template_conspecifix/
perl setup_simulation_step2.pl ../template_conspecifix/

# running part of the conSpeciFix analysis
cd simulation/_conspecifix/scripts/database
python child_runner.py

# pick the 100 representative sequences
## the sequence IDs of the 100 representative genomes will be saved in  ./simulation/_conspecifix/database/User_spec/sample.txt

for i in ancC preM E NS1 NS2a NS2b NS3 NS4a 2k NS4b NS5 # for flavivirus
#for i in nsP1 nsP2 nsP3 nsP4 C E3 E2 6k E1 # for alphaviruses 
do
 echo "$i"
 perl pick_sequences_on_list.pl $i.cds.fasta.rename ./simulation/_conspecifix/database/User_spec/sample.txt ZIKV $i.cds.fasta\_sample100
done
