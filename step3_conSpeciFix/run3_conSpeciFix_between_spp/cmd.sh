# concatenate all the between species genomes together and run multiple sequence align
sh batch_cat.sh
sh batch_aln.sh

# concatenate genes together 
grep ">" nsP2.cds.fasta.pep| perl -e 'while(<>){s/>//; print}' | sort > spp.list
perl ../Concatenation_v1.1_virus_bed.pl ../concate.list.order concate.list.fasta spp.list 

# replace _ to -
less -S concate.list.fasta | perl -e 'while(<>){ if(/>/){s/\_/\-/; print}else{print}  }' > simulation.fasta

# pick sequences from each lineage based on the list provided in step 2
## example file can be found in this folder: strains.list
sh batch_pick_sequences_and_reformat.sh

# batch conSpeciFix
## create a list of genome files. Each genome file correspond to one lineage. All the files can be found under ./alphavirus_lineages and ./flavivirus_lineages
ls *.list.rename.fasta > fasta.list

## set up conSpeciFix runs
perl batch.pl fasta.list 

## batch run all the between lineage conSpeciFix analysis
ls -d */ > folder.list
sh batch.sh
