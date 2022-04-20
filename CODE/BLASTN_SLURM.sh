#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 3:00:00
#SBATCH -J blastn
#SBATCH --mail-type=ALL
#SBATCH --mail-user ksolander@me.com

#Load modules
module load bioinfo-tools
module load blast

#Run blastn
blastn -outfmt 6 -subject /home/klso6609/GitHub/Genome-Analysis/DATA/REFERENCE/GCF_009734005.1_ASM973400v2_genomic.fna -query /home/klso6609/GitHub/Genome-Analysis/RESULTS/ASSEMBLY/CANU/PACBIO_DNA_ASSEMBLY_CANU.contigs.fasta -out /home/klso6609/GitHub/Genome-Analysis/RESULTS/SYNTENY/synteny_same_species.tab
