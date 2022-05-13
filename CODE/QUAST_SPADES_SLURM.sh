#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 6:00:00
#SBATCH -J Canu_assembly
#SBATCH --mail-type=ALL
#SBATCH --mail-user ksolander@me.com

# Load modules
module load bioinfo-tools
module load quast

# Your commands
quast.py -o /home/klso6609/GitHub/Genome-Analysis/RESULTS/05_EVAL_ANNO/QUAST/SPADES -R /home/klso6609/GitHub/Genome-Analysis/DATA/REFERENCE/GCF_009734005.1_ASM973400v2_genomic.fna /home/klso6609/GitHub/Genome-Analysis/RESULTS/04_GENOME_ASSEMBLY/SPADES/scaffolds.fasta

