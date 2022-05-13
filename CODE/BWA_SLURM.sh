#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 6:00:00
#SBATCH -J BWA_assembly
#SBATCH --mail-type=ALL
#SBATCH --mail-user ksolander@me.com


# Load modules
module load bioinfo-tools
module load bwa
module load samtools

# Create bwa index
bwa index /home/klso6609/GitHub/Genome-Analysis/RESULTS/04_GENOME_ASSEMBLY/PACBIO_DNA_ASSEMBLY_CANU.contigs.fasta

# Perform bwa aln alignment on BHI
cd /home/klso6609/GitHub/Genome-Analysis/DATA/RAW/transcriptomics_data/transcriptomics_data/RNA-Seq_BH
for i in trim_paired*
do
	bwa aln /home/klso6609/GitHub/Genome-Analysis/RESULTS/04_GENOME_ASSEMBLY/PACBIO_DNA_ASSEMBLY_CANU.contigs.fasta $i > /home/klso6609/GitHub/Genome-Analysis/RESULTS/06_RNA_MAPPING/BHI/${i}.sai
done

# Perform bwa sampe alignment on BHI
for i in {2..4}
do
	bwa sampe /home/klso6609/GitHub/Genome-Analysis/RESULTS/04_GENOME_ASSEMBLY/PACBIO_DNA_ASSEMBLY_CANU.contigs.fasta \
	/home/klso6609/GitHub/Genome-Analysis/RESULTS/06_RNA_MAPPING/BHI/trim_paired_ERR179797${i}* \
	/home/klso6609/GitHub/Genome-Analysis/DATA/RAW/transcriptomics_data/transcriptomics_data/RNA-Seq_BH/trim_paired_ERR179797${i}* \
	| samtools sort -o /home/klso6609/GitHub/Genome-Analysis/RESULTS/06_RNA_MAPPING/BHI/bwa_aligned_ERR179797${i}.bam
done

# Perform bwa aln alignment Serum
cd /home/klso6609/GitHub/Genome-Analysis/DATA/RAW/transcriptomics_data/transcriptomics_data/RNA-Seq_Serum
for i in trim_paired*
do
        bwa aln /home/klso6609/GitHub/Genome-Analysis/RESULTS/04_GENOME_ASSEMBLY/PACBIO_DNA_ASSEMBLY_CANU.contigs.fasta $i > /home/klso6609/GitHub/Genome-Analysis/RESULTS/06_RNA_MAPPING/Serum/${i}.sai
done

# Perform bwa sampe alignment Serum
for i in {69..71}
do
        bwa sampe /home/klso6609/GitHub/Genome-Analysis/RESULTS/04_GENOME_ASSEMBLY/PACBIO_DNA_ASSEMBLY_CANU.contigs.fasta \
        /home/klso6609/GitHub/Genome-Analysis/RESULTS/06_RNA_MAPPING/Serum/trim_paired_ERR17979${i}* \
        /home/klso6609/GitHub/Genome-Analysis/DATA/RAW/transcriptomics_data/transcriptomics_data/RNA-Seq_Serum/trim_paired_ERR17979${i}* \
	| samtools sort -o /home/klso6609/GitHub/Genome-Analysis/RESULTS/06_RNA_MAPPING/Serum/bwa_aligned_ERR17979${i}.bam
done
