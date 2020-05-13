cat strains.list | while read i
do
 echo $i
 perl pick_sequences_on_list.pl simulation.fasta $i\.list.rename $i\.list.rename.fasta
 perl rename.pl $i\.list.rename.fasta $i $i.fasta
done
