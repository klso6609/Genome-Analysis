#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 3:00:00
#SBATCH -J bcftools
#SBATCH --mail-type=ALL
#SBATCH --mail-user ksolander@me.com

# Load modules
module load bioinfo-tools
module load samtools

# Looping through the files

for x in /home/klso6609/GitHub/Genome-Analysis/RESULTS/RNA_MAPPING/*.sam
do
	base=$(basename $x.sam)
	samtools sort ${base}.sam -o /home/klso6609/GitHub/Genome-Analysis/RESULTS/RNA_MAPPING/${base}.bam
done
