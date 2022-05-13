# R script for running DESeq
library(DESeq2)

# Creating DESeq data set
datadir <- "/home/klso6609/GitHub/Genome-Analysis/RESULTS/07_DIFF_EX_ANALYSIS/HTSeq"
sample <- c('BH1htseq', 'BH2htseq', 'BH3htseq', 'Serum1htseq', 'Serum2htseq', 'Serum3htseq')
fileName <- c('BH1htseq.txt', 'BH2htseq.txt', 'BH3htseq.txt', 'Serum1htseq.txt', 'Serum2htseq.txt', 'Serum3htseq.txt')
type <- c('BH', 'BH', 'BH', 'Se', 'Se', 'Se')
phdata <- data.frame(sample, fileName, type)
#phdata <- data.frame(fname=list.files(path=datadir, pattern= "*htseq.txt"),stringsAsFactors=FALSE)
#phdata <- phdata %>% transmute(sample=substr(fname,1,3),fname)
#phdata <- phdata %>% mutate(trt=as.factor(substr(sample,1,2)), repl=substr(sample,3,3))
dds <- DESeqDataSetFromHTSeqCount(sampleTable=phdata,directory=datadir,design=~ type)

#dds <- estimateSizeFactors(dds)
#dds<-estimateDispersions(dds)

# Doing the expression analysis
ddsDE<-DESeq(dds)
myres<-results(ddsDE)
write.csv(as.data.frame(myres), file="/home/klso6609/GitHub/Genome-Analysis/RESULTS/07_DIFF_EX_ANALYSIS/HTSeq/DESeq_analysis_table.csv")

# Ploting and saving to file
png(file="/home/klso6609/GitHub/Genome-Analysis/RESULTS/07_DIFF_EX_ANALYSIS/HTSeq/DESeq_plot.png")
plot(myres$log2FoldChange,-log10(myres$pvalue),pch=19,cex=0.3,xlab="Log2 FC",ylab="-log10(P-value)",col=ifelse(myres$pvalue<0.05&abs(myres$log2FoldChange)>1,"red","black"))
dev.off()

# Saving filtered and ordered subset of the expression analysis
res_p0.05_FC1<-subset(myres,pvalue<0.05&abs(log2FoldChange)>1)
res_p0.05_FC1_ordered <- res_p0.05_FC1[order(res_p0.05_FC1$log2FoldChange),]
write.csv(as.data.frame(res_p0.05_FC1_ordered), file="/home/klso6609/GitHub/Genome-Analysis/RESULTS/07_DIFF_EX_ANALYSIS/HTSeq/res_p0.05_FC1_ordered.csv")
