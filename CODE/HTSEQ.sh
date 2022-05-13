#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 24:00:00
#SBATCH -J HTSEQ
#SBATCH --mail-type=ALL
#SBATCH --mail-user ksolander@me.com

# Load modules
module load bioinfo-tools
module load htseq
module load samtools

# Run HTSeq for	BHI files
#htseq-count -f bam -r pos -i ID -t CDS \
#/home/klso6609/GitHub/Genome-Analysis/RESULTS/06_RNA_MAPPING/BHI/*.bam \
#/home/klso6609/GitHub/Genome-Analysis/RESULTS/05_EVAL_ANNO/PROKKA/PROKKA_04082022.gff \
#> /home/klso6609/GitHub/Genome-Analysis/RESULTS/07_DIFF_EX_ANALYSIS/HTSeq/BH_htseq.txt

# Run HTSeq for Serum samples
htseq-count -f bam -r pos -i ID -t CDS \
/home/klso6609/GitHub/Genome-Analysis/RESULTS/06_RNA_MAPPING/Serum/*.bam \
/home/klso6609/GitHub/Genome-Analysis/RESULTS/05_EVAL_ANNO/PROKKA/PROKKA_04082022.gff \
> /home/klso6609/GitHub/Genome-Analysis/RESULTS/07_DIFF_EX_ANALYSIS/HTSeq/Serum_htseq.txt

