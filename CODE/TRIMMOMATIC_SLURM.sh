#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 04:00:00
#SBATCH -J trimmomatic
#SBATCH --mail-type=ALL
#SBATCH --mail-user ksolander@me.com
#SBATCH --reservation=uppmax2022-2-5_2

# Load modules
module load bioinfo-tools
module load spider trimmomatic

# Your commands 
#ILLUMINACLIP

cd $HOME/GitHub/Genome-Analysis/INTERMEDIATE

trimmomatic PE $HOME/GitHub/Genome-Analysis/DATA/RAW/genomic_data/Illumina/E745-1.L500_SZAXPI015146-56_1_clean.fq.gz \
$HOME/GitHub/Genome-Analysis/DATA/RAW/genomic_data/Illumina/E745-1.L500_SZAXPI015146-56_2_clean.fq.gz \
trimmomatic_output_forward trimmomatic_output_reverse ILLUMINACLIP:TruSeq2-PE.fa   

 
