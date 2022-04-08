#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 04:00:00
#SBATCH -J trimmomatic_fixed
#SBATCH --mail-type=ALL
#SBATCH --mail-user ksolander@me.com
#SBATCH --reservation=uppmax2022-2-5_3

# Load modules
module load bioinfo-tools
module load trimmomatic

# Your commands 
trimmomatic PE -phred33 /home/klso6609/GitHub/Genome-Analysis/DATA/RAW/genomics_data/Illumina/E745-1.L500_SZAXPI015146-56_1_clean.fq.gz /home/klso6609/GitHub/Genome-Analysis/DATA/RAW/genomics_data/Illumina/E745-1.L500_SZAXPI015146-56_2_clean.fq.gz /home/klso6609/GitHub/Genome-Analysis/RESULTS/PREPROCESSING/TRIMMOMATIC/trimmomatic_output_paired_forward.fq /home/klso6609/GitHub/Genome-Analysis/RESULTS/PREPROCESSING/TRIMMOMATIC/trimmomatic_output_unpaired_forward.fq /home/klso6609/GitHub/Genome-Analysis/RESULTS/PREPROCESSING/TRIMMOMATIC/trimmomatic_output_paired_reverse.fq /home/klso6609/GitHub/Genome-Analysis/RESULTS/PREPROCESSING/TRIMMOMATIC/trimmomatic_output_unpaired_reverse.fq ILLUMINACLIP:/sw/bioinfo/trimmomatic/0.36/rackham/trimmomatic/rackham/adapters/TruSeq3-PE.fa:2:30:10:2:keepBothReads LEADING:35 TRAILING:35 MINLEN:35


