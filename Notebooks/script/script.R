## RNA-seq analysis with DESeq2
## Stephen Turner, @genetics_blog
## Slightly edited from https://gist.github.com/stephenturner/f60c1934405c127f09a6
## and http://www.gettinggeneticsdone.com/2015/12/tutorial-rna-seq-differential.html

## Using data from GSE37704, with processed data available on Figshare DOI: 10.6084/m9.figshare.1601975. 
## This dataset has six samples from GSE37704, where expression was quantified by either: 
##   (A) mapping to to GRCh38 using STAR then counting reads mapped to genes with featureCounts under 
##      the union-intersection model, or 
##  (B) alignment-free quantification using Sailfish, summarized at the gene level using the GRCh38 GTF 
##      file. Both datasets are restricted to protein-coding genes only. 

source('get_data.R')

# Analysis with DESeq2 ----------------------------------------------------

library(DESeq2)

# Instantiate the DESeqDataSet. See ?DESeqDataSetFromMatrix
dds <- DESeqDataSetFromMatrix(countData=countdata, colData=coldata, design=~condition)
dds

# Run the DESeq pipeline
dds <- DESeq(dds)

# Plot dispersions
png("qc-dispersions.png", 1000, 1000, pointsize=20)
plotDispEsts(dds, main="Dispersion plot")
dev.off()

# Regularized log transformation for clustering/heatmaps, etc
rld <- rlogTransformation(dds)
head(assay(rld))
hist(assay(rld))

# Colors for plots below
## Ugly:
## (mycols <- 1:length(unique(condition)))
## Use RColorBrewer, better
library(RColorBrewer)
(mycols <- brewer.pal(8, "Dark2")[1:length(unique(coldata$condition))])

# Sample distance heatmap
sampleDists <- as.matrix(dist(t(assay(rld))))
png("qc-heatmap-samples.png", w=1000, h=1000, pointsize=20)
heatmap(as.matrix(sampleDists), 
          ColSideColors=mycols[coldata$condition], RowSideColors=mycols[coldata$condition],
          margin=c(10, 10), main="Sample Distance Matrix")
dev.off()

# Principal components analysis
# Built-In DESeq2 plot:

png("qc-pca-deseq.png", 1000, 1000, pointsize=20)
DESeq2::plotPCA(rld, intgroup="condition")
dev.off()

source('plot_routines.R')
## Stephen Turner's version:
png("qc-pca-st.png", 1000, 1000, pointsize=20)
st_rld_pca(rld, colors=mycols, intgroup="condition", xlim=c(-75, 35))
dev.off()


# Get differential expression results
res <- results(dds)
## Order by adjusted p-value
res <- res[order(res$padj), ]
res <- res[complete.cases(res),]
res$value <- ifelse(res$pvalue < 1.e-250, 1.e-250, res$pvalue)

summary(res)

## Merge with normalized count data
resdata <- merge(as.data.frame(res), as.data.frame(counts(dds, normalized=TRUE)), by="row.names", sort=FALSE)
names(resdata)[1] <- "Gene"
resdata$Gene <- as.character(resdata$Gene)
head(resdata)
## Write results
#write.csv(resdata, file="diffexpr-results.csv")

## Examine plot of p-values
hist(res$pvalue, breaks=50, col="grey")


## MA plot
## Built-in to DESeq:
png("diffexpr-maplot-deseq.png", 1500, 1000, pointsize=20)
DESeq2::plotMA(dds)
dev.off()

## From Stephen Turner:
png("diffexpr-maplot-st.png", 1500, 1000, pointsize=20)
st_maplot(resdata, main="MA Plot")
dev.off()

## Volcano plot with "significant" genes labeled
png("diffexpr-volcanoplot.png", 1200, 1000, pointsize=20)
volcanoplot(resdata, lfcthresh=2, sigthresh=0.00005, textcx=.8, topsig=5)
dev.off()
