#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 06:00:00
#SBATCH -J job_name
#SBATCH --mail-type=ALL
#SBATCH --mail-user ksolander@me.com
#SBATCH --reservation=uppmax2022-2-5_2

# Load modules
module load bioinfo-tools
module load FastQC

# Your commands 
#fastqc
#-o [output directory]
#-f [filformat]
#-d [selects a temporary file directory]
#-c [contaminant file]
# ange sen alla sekvens filer

fastqc -o $HOME/GitHub/Genome-Analysis/RESULTS/PREPROCESSING/QC -f fastq -d $HOME/GitHub/Genome-Analysis/INTERMEDIATE $HOME/GitHub/Genome-Analysis/DATA/RAW/genomic_data/Illumina/* 

