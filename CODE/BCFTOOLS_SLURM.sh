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
module load bcftools

# Running BCFtools
#Align to reference through bcf
/sw/bioinfo/bcftools/1.14/rackham/bin/bcftools mpileup -f /home/klso6609/GitHub/Genome-Analysis/DATA/ncbi-genomes-2022-04-08/GCF_009734005.1_ASM973400v2_genomic.fna /home/klso6609/GitHub/Genome-Analysis/RESULTS/ASSEMBLY/CANU/PACBIO_DNA_ASSEMBLY_CANU.contigs.fasta | /sw/bioinfo/bcftools/1.14/rackham/bin/bcftools call -mv -Ob -o /home/klso6609/GitHub/Genome-Analysis/RESULTS/ASSEMBLY/BCFtools/BCFtools_PACBIO_DNA_ASSEMBLY_CANU.bcf 

#Covert the bcf file to text format
/sw/bioinfo/bcftools/1.14/rackham/bin/bcftools view /home/klso6609/GitHub/Genome-Analysis/RESULTS/ASSEMBLY/BCFtools/BCFtools_PACBIO_DNA_ASSEMBLY_CANU.bcf -o /home/klso6609/GitHub/Genome-Analysis/RESULTS/ASSEMBLY/BCFtools/BCFtools_PACBIO_DNA_ASSEMBLY_CANU.vcf
