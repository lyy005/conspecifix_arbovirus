cat fasta.list | while read i
do
 echo "$i"
 perl /user/bin/codon_alignment_v1.5/codon_alignment.pl $i 1 0 & 
done

grep ">" genomes_preM.cds.fasta.pep.aln | perl -e 'while(<>){s/>//; @a=split; print "$a[0]\n"}' | sort > genomes.list
