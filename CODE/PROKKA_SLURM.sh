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
module load prokka

# Your commands
# -p vad filen ska heta
# -d vart du vill lägga resultatet 
prokka /home/klso6609/GitHub/Genome-Analysis/RESULTS/ASSEMBLY/PACBIO_DNA_ASSEMBLY_CANU.contigs.fasta
