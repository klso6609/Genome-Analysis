#!/usr/bin/env Rscript

#Loading data
bh <- read.table("/home/klso6609/GitHub/Genome-Analysis/RESULTS/07_DIFF_EX_ANALYSIS/HTSeq/BH_htseq.txt")
serum <- read.table("/home/klso6609/GitHub/Genome-Analysis/RESULTS/07_DIFF_EX_ANALYSIS/HTSeq/Serum_htseq.txt")

#Splitting data into replicates and plot
geneID <- c(1:3126)
bh_1 <- bh[c(1:3126),c(2)]
bh_2 <- bh[c(1:3126),c(3)]
bh_3 <- bh[c(1:3126),c(4)]
serum_1 <- serum[c(1:3126),c(2)]
serum_2 <- serum[c(1:3126),c(3)]
serum_3 <- serum[c(1:3126),c(4)]
png("htseq_plot.png")
plot(geneID, serum_1, xlab="GeneID", ylab="Counts",
     main="Count Distribution for Serum (blue) and BH (yellow)", col="blue")
points(geneID, serum_2, col="blue")
points(geneID, serum_3, col="blue")
points(geneID, bh_1, col="yellow")
points(geneID, bh_2, col="yellow")
points(geneID, bh_3, col="yellow")
dev.off()
