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

countdata <- read.csv("http://www.dursi.ca/content/images/GSE37704_featurecounts.csv", header=TRUE, row.names=1)
coldata <- read.csv("http://www.dursi.ca/content/images/GSE37704_metadata.csv", header=TRUE, row.names=1)

# Remove first column (length)
countdata <- countdata[-1]

# Convert to matrix
countdata <- as.matrix(countdata)
head(countdata)

