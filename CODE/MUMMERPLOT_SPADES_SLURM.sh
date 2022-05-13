#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 04:00:00
#SBATCH -J MUMmerplot
#SBATCH --mail-type=ALL
#SBATCH --mail-user ksolander@me.com

# Load modules
module load bioinfo-tools
module load MUMmer

# Your commands 
mummer -mum -b -c /home/klso6609/GitHub/Genome-Analysis/DATA/REFERENCE/GCF_009734005.1_ASM973400v2_genomic.fna /home/klso6609/GitHub/Genome-Analysis/RESULTS/04_GENOME_ASSEMBLY/SPADES/scaffolds.fasta > /home/klso6609/GitHub/Genome-Analysis/RESULTS/05_EVAL_ANNO/MUMMER/REF_ASSEMBLY_ILLLUMINA_SUBPLOTS_2.mums

mummerplot -png -p REF_ASSEMBLY_SUBPLOTS_2 -R /home/klso6609/GitHub/Genome-Analysis/DATA/REFERENCE/GCF_009734005.1_ASM973400v2_genomic.fna -Q /home/klso6609/GitHub/Genome-Analysis/RESULTS/04_GENOME_ASSEMBLY/SPADES/scaffolds.fasta /home/klso6609/GitHub/Genome-Analysis/RESULTS/05_EVAL_ANNO/MUMMER/REF_ASSEMBLY_ILLLUMINA_SUBPLOTS_2.mums

