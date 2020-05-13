# Analytical pipeline used to classify arboviral species based on gene flow (recombination)

This document is a walkthrough of the data and analytical pipeline used to delineate the species boundaries of arboviruses (Flaviviruses and Alphaviruses) based on Biological Species Concept (BSC). We measured the amount of gene flow by estimating the ratio between the number of homoplasic polymorphisms and the number of non-homoplasic polymorphisms (*h/m* ratio).

## Programs used in the analysis

ConSpeciFix (https://github.com/Bobay-Ochman/ConSpeciFix)

Exonerate (https://www.ebi.ac.uk/about/vertebrate-genomics/software/exonerate)

BIONJ_linux (http://www.atgc-montpellier.fr/bionj/download.php)

SeqGen version 1.3.4 (http://tree.bio.ed.ac.uk/software/seqgen/)



## 1 - Arboviral genomes and reference protein sequences

Genome sequences downloaded from https://www.viprbrc.org/ can be found under: 

    ./step1_genomes_and_ref_proteins/alphaviruses/
    ./step1_genomes_and_ref_proteins/flaviviruses/

Each folder also includeds protein sequences (\*.pep) of each gene for annotaiton. 

## 2 - Arboviral genome annotation

Annotate all the genes:  

    sh ./step2_annotation/run1_batch_annotation.sh

Perform codon-based alignment for each gene

    sh ./step2_annotation/run2_batch_aln.sh
    
Concatenate all the genes together, in the same order as the genes in the viral genomes. After running this script, all the genes are concatenated and saved to file "concate.list.fasta". 
    
    sh ./step2_annotation/run3_concatenate_genes.sh

## 3 - ConSpeciFix analysis

### 3a - pick 100 representative genomes using ConSpeciFix

Considering the computational efficiency, only 100 representative genomes are analyzed if there are more than 100 viral genomes.

    sh ./step3_conSpeciFix/run1_conSpeciFix_pick_100_representative_genomes/cmd.sh
    

### 3b - Run ConSpeciFix analysis between lineages within the same ICTV-designated species.

    
    sh ./step3_conSpeciFix/run2_conSpeciFix_within_spp/cmd.sh

### 3c - Run ConSpeciFix between lineages of different ICTV-designated species.


    sh ./step3_conSpeciFix/run3_conSpeciFix_between_spp/cmd.sh

## 4 - Simulation

To access whether the observed recombination is due to convergent mutations, we simulated genomes based on the observed distance between genomes and ran ConSpeciFix on those simulated genomes. 
    
    sh ./step4_simulation/cmd.sh
    
## Citation

Li Y, O’Donnell A, Ochman H. 2020. Discriminating Arboviral Species

Bobay L, Ellis BS, Ochman H. 2018. ConSpeciFix: classifying prokaryotic species based on gene flow. Bioinformatics 34.21: 3738-3740.
