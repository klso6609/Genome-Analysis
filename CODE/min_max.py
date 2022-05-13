#! /usr/bin/env Python

import pandas as pd

DESeq = pd.read_csv('/home/klso6609/GitHub/Genome-Analysis/RESULTS/07_DIFF_EX_ANALYSIS/HTSeq/DESeq_analysis_table.csv')
prokka = pd.read_csv('/home/klso6609/GitHub/Genome-Analysis/RESULTS/05_EVAL_ANNO/PROKKA/PROKKA_04082022.tsv', sep='\t')

up_regulated = DESeq.nlargest(n=10, columns=['log2FoldChange'], keep='all')
down_regulated = DESeq.nsmallest(n=10, columns=['log2FoldChange'], keep='all')

up_locus_tag = up_regulated['Unnamed: 0']
down_locus_tag = down_regulated['Unnamed: 0']

up_regulated_df = prokka[prokka["locus_tag"].isin(up_locus_tag.tolist())][['locus_tag','gene','product']]
down_regulated_df = prokka[prokka["locus_tag"].isin(down_locus_tag.tolist())][['locus_tag','gene','product']]

up_log = pd.concat([up_regulated], axis = 0)[['Unnamed: 0', 'log2FoldChange']]
up_log.columns = ['locus_tag', 'log2FoldChange']
up_result = up_regulated_df.merge(up_log, on = 'locus_tag', how='outer')

print('The up-regulated genes are: \n', up_result)

down_log = pd.concat([down_regulated], axis = 0)[['Unnamed: 0', 'log2FoldChange']]
down_log.columns = ['locus_tag', 'log2FoldChange']

down_result = down_regulated_df.merge(down_log, on = 'locus_tag', how='outer')

print('The down-regulated genes are: \n', down_result)

