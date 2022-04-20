# Load modules
module load bioinfo-tools
module load bwa
module load samtools


# Perform bwa aln alignment on BH
cd ~/genome_analysis/data/raw_data/transcriptomics_data/RNA-Seq_BH
for i in trim_paired*
do
	bwa aln /home/klso6609/GitHub/Genome-Analysis/RESULTS/ASSEMBLY/CANU/PACBIO_DNA_ASSEMBLY_CANU.contigs.fasta $i > /home/klso6609/GitHub/Genome-Analysis/RESULTS/RNA_MAPPING/${i}.sai
done

# Perform bwa sampe alignment on BH
for i in {2..4}
do
	bwa sampe ~/genome_analysis/analyses/01_genome_assembly/assembly.contigs.fasta \
	~/genome_analysis/analyses/07_bwa_alignment/BH_aln/trim_paired_ERR179797${i}* \
	~/genome_analysis/data/raw_data/transcriptomics_data/RNA-Seq_BH/trim_paired_ERR179797${i}* \
	| samtools sort -o ~/genome_analysis/analyses/07_bwa_alignment/BH_sampe/bwa_aligned_ERR179797${i}.bam
done
