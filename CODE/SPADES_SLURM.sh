#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 24:00:00
#SBATCH -J SPADES_assembly
#SBATCH --mail-type=ALL
#SBATCH --mail-user ksolander@me.com
#SBATCH --reservation=uppmax2022-2-5_5

# Load modules
module load bioinfo-tools
module load spades

# Your commands
# -o output directory 
spades.py -k 55 -1 /home/klso6609/GitHub/Genome-Analysis/RESULTS/02_TRIMMING/TRIMMOMATIC/trimmomatic_output_paired_forward.fq -2 /home/klso6609/GitHub/Genome-Analysis/RESULTS/02_TRIMMING/TRIMMOMATIC/trimmomatic_output_paired_reverse.fq --nanopore /home/klso6609/GitHub/Genome-Analysis/DATA/RAW/genomics_data/Nanopore/E745_all.fasta.gz -o /home/klso6609/GitHub/Genome-Analysis/RESULTS/04_GENOME_ASSEMBLY/SPADES
