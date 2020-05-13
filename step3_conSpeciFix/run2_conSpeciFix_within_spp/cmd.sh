# create a list of genome files. Each genome file correspond to one lineage. All the files can be found under ./alphavirus_lineages and ./flavivirus_lineages
ls *.fasta > fasta.list

# set up conSpeciFix runs
perl batch.pl fasta.list 

# batch run all the between lineage conSpeciFix analysis
ls -d */ > folder.list
sh batch.sh
