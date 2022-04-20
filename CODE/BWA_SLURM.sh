#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 6:00:00
#SBATCH -J BWA_assembly
#SBATCH --mail-type=ALL
#SBATCH --mail-user ksolander@me.com
#SBATCH --reservation=uppmax2022-2-5_4


# Load modules
module load bioinfo-tools
module load bwa

#Change directory
cd $SNIC_TMP

# Create bwa index
bwa index /home/klso6609/GitHub/Genome-Analysis/RESULTS/ASSEMBLY/CANU/PACBIO_DNA_ASSEMBLY_CANU.contigs.fasta

#-----First replicate BHI-----

#BWA aln
bwa aln /home/klso6609/GitHub/Genome-Analysis/RESULTS/ASSEMBLY/CANU/PACBIO_DNA_ASSEMBLY_CANU.contigs.fasta \
/home/klso6609/GitHub/Genome-Analysis/DATA/RAW/transcriptomics_data/transcriptomics_data/RNA-Seq_BH/trim_paired_ERR1797972_pass_1.fastq.gz /home/klso6609/GitHub/Genome-Analysis/DATA/RAW/transcriptomics_data/transcriptomics_data/RNA-Seq_BH/trim_paired_ERR1797972_pass_2.fastq.gz > BH_aln_paired_ERR1797972.sai

#BWA sampe
bwa sampe /home/klso6609/GitHub/Genome-Analysis/RESULTS/ASSEMBLY/CANU/PACBIO_DNA_ASSEMBLY_CANU.contigs.fasta \
BH_aln_paired_ERR1797972.sai \
/home/klso6609/GitHub/Genome-Analysis/DATA/RAW/transcriptomics_data/transcriptomics_data/RNA-Seq_BH/trim_paired_ERR1797972_pass_1.fastq.gz \
| samtools sort -o BH_aln_paired_ERR1797972.bam


#-----Second replicate BHI-----
#bwa mem /home/klso6609/GitHub/Genome-Analysis/RESULTS/ASSEMBLY/CANU/PACBIO_DNA_ASSEMBLY_CANU.contigs.fasta \
#/home/klso6609/GitHub/Genome-Analysis/DATA/RAW/transcriptomics_data/transcriptomics_data/RNA-Seq_BH/trim_paired_ERR1797973_pass_1.fastq.gz /home/klso6609/GitHub/Genome-Analysis/DATA/RAW/transcriptomics_data/transcriptomics_data/RNA-Seq_BH/trim_paired_ERR1797973_pass_2.fastq.gz > /BH_aln_paired_ERR1797973.sam

#BWA aln
bwa aln /home/klso6609/GitHub/Genome-Analysis/RESULTS/ASSEMBLY/CANU/PACBIO_DNA_ASSEMBLY_CANU.contigs.fasta \
/home/klso6609/GitHub/Genome-Analysis/DATA/RAW/transcriptomics_data/transcriptomics_data/RNA-Seq_BH/trim_paired_ERR1797973_pass_1.fastq.gz /home/klso6609/GitHub/Genome-Analysis/DATA/RAW/transcriptomics_data/transcriptomics_data/RNA-Seq_BH/trim_paired_ERR1797973_pass_2.fastq.gz > BH_aln_paired_ERR1797973.sai

#BWA sampe
bwa sampe /home/klso6609/GitHub/Genome-Analysis/RESULTS/ASSEMBLY/CANU/PACBIO_DNA_ASSEMBLY_CANU.contigs.fasta \
BH_aln_paired_ERR1797972.sai \
/home/klso6609/GitHub/Genome-Analysis/DATA/RAW/transcriptomics_data/transcriptomics_data/RNA-Seq_BH/trim_paired_ERR1797972_pass_1.fastq.gz \
| samtools sort -o BH_aln_paired_ERR1797972.bam



#-----Third replicate BHI----- 
#bwa mem /home/klso6609/GitHub/Genome-Analysis/RESULTS/ASSEMBLY/CANU/PACBIO_DNA_ASSEMBLY_CANU.contigs.fasta \
#/home/klso6609/GitHub/Genome-Analysis/DATA/RAW/transcriptomics_data/transcriptomics_data/RNA-Seq_BH/trim_paired_ERR1797974_pass_1.fastq.gz /home/klso6609/GitHub/Genome-Analysis/DATA/RAW/transcriptomics_data/transcriptomics_data/RNA-Seq_BH/trim_paired_ERR1797974_pass_2.fastq.gz > /BH_aln_paired_ERR1797974.sam




#-----First replicate Serum----- 
#bwa mem /home/klso6609/GitHub/Genome-Analysis/RESULTS/ASSEMBLY/CANU/PACBIO_DNA_ASSEMBLY_CANU.contigs.fasta \
#/home/klso6609/GitHub/Genome-Analysis/DATA/RAW/transcriptomics_data/transcriptomics_data/RNA-Seq_Serum/trim_paired_ERR1797969_pass_1.fastq.gz /home/klso6609/GitHub/Genome-Analysis/DATA/RAW/transcriptomics_data/transcriptomics_data/RNA-Seq_Serum/trim_paired_ERR1797969_pass_2.fastq.gz > /Serum_aln_paired_ERR1797969.sam



#-----Second replicate Serum----- 
bwa mem /home/klso6609/GitHub/Genome-Analysis/RESULTS/ASSEMBLY/CANU/PACBIO_DNA_ASSEMBLY_CANU.contigs.fasta \
/home/klso6609/GitHub/Genome-Analysis/DATA/RAW/transcriptomics_data/transcriptomics_data/RNA-Seq_Serum/trim_paired_ERR1797970_pass_1.fastq.gz /home/klso6609/GitHub/Genome-Analysis/DATA/RAW/transcriptomics_data/transcriptomics_data/RNA-Seq_Serum/trim_paired_ERR1797970_pass_2.fastq.gz > /Serum_aln_paired_ERR1797970.sam

#-----Third replicate Serum----- 
bwa mem /home/klso6609/GitHub/Genome-Analysis/RESULTS/ASSEMBLY/CANU/PACBIO_DNA_ASSEMBLY_CANU.contigs.fasta \
/home/klso6609/GitHub/Genome-Analysis/DATA/RAW/transcriptomics_data/transcriptomics_data/RNA-Seq_Serum/trim_paired_ERR1797971_pass_1.fastq.gz /home/klso6609/GitHub/Genome-Analysis/DATA/RAW/transcriptomics_data/transcriptomics_data/RNA-Seq_Serum/trim_paired_ERR1797971_pass_2.fastq.gz > /Serum_aln_paired_ERR1797971.sam

#HTSeq
htseq-count -f bam -r pos -i ID -t CDS \
*.bam \
/home/klso6609/GitHub/Genome-Analysis/RESULTS/ASSEMBLY/PROKKA/PROKKA_04082022.gff \
/home/klso6609/GitHub/Genome-Analysis/RESULTS/HT_SEQ/BH_htseq_count.txt
