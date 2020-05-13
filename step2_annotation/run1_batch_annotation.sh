for i in ancC preM E NS1 NS2a NS2b NS3 NS4a 2k NS4b NS5 # for flaviviruses
# for i in nsP1 nsP2 nsP3 nsP4 C E3 E2 6k E1 # for alphaviruses
do
 # exonerate annotation
 echo $i
 exonerate --model protein2genome $i\.annotation.pep genomes.fasta  --ryo ">%ti (%tab - %tae)\n%tas\n" --showquerygff no --showvulgar no --showalignment no | grep -v "Command" | grep -v "Host" | grep -v "\-\-" > genomes_$i\.exonerate
 perl pick_longest_annotation.pl genomes_$i\.exonerate genomes_$i\.cds.fasta
done

ls *.cds.fasta > fasta.list
