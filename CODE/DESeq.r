#!/usr/bin/env Rscript

#Loading DESeq2
library(DESeq2)

# Creating DESeq data set
HTSeqdirectory <- "/home/klso6609/GitHub/Genome-Analysis/RESULTS/07_DIFF_EX_ANALYSIS/HTSeq/"
sample <- c('BH1_htseq', 'BH2_htseq', 'BH3_htseq', 'Se1_htseq', 'Se2_htseq', 'Se3_htseq')
fileName <- c('BH1_htseq.txt', 'BH2_htseq.txt', 'BH3_htseq.txt', 'Serum1_htseq.txt', 'Serum2_htseq.txt', 'Serum3_htseq.txt')
type <- c('BH', 'SE')
phdata <- data.frame(sampleName = sample, fileName = fileName, condition = type)
dds <- DESeqDataSetFromHTSeqCount(sampleTable=phdata,directory=HTSeqdirectory,design=~ type)

# Expression analysis
ddsDE<-DESeq(dds)
myres<-results(ddsDE)
write.csv(as.data.frame(myres), file="/home/klso6609/GitHub/Genome-Analysis/RESULTS/07_DIFF_EX_ANALYSIS/DESeq.csv")

# Ploting and saving to file
png(file="/home/klso6609/GitHub/Genome-Analysis/RESULTS/07_DIFF_EX_ANALYSIS/DESeq_plot.png")
plot(myres$log2FoldChange,-log10(myres$pvalue),pch=19,cex=0.3,xlab="Log2 FC",ylab="-log10(P-value)",col=ifelse(myres$pvalue<0.05&abs(myres$log2FoldChange)>1,"yellow","blue"))
dev.off()

# Saving filtered and ordered subset of the expression analysis
res_p0.05_FC1<-subset(myres,pvalue<0.05&abs(log2FoldChange)>1)
res_p0.05_FC1_ordered <- res_p0.05_FC1[order(res_p0.05_FC1$log2FoldChange),]
write.csv(as.data.frame(res_p0.05_FC1_ordered), file="~/genome_analysis/analyses/09_DESeq/res_p0.05_FC1_ordered.csv")
