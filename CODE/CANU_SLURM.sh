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
module load canu

# Your commands
# -p vad filen ska heta
# -d vart du vill lägga resultatet 


cd $HOME/GitHub/Genome-Analysis/INTERMEDIATE
canu -p PACBIO_DNA_ASSEMBLY_CANU -d $HOME/GitHub/Genome-Analysis/RESULTS/ASSEMBLY genomeSize=2.7m -pacbio $HOME/GitHub/Genome-Analysis/DATA/RAW/genomics_data/PacBio/*
