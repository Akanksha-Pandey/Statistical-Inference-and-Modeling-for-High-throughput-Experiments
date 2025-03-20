library(devtools)

install_github("genomicsclass/GSE5859Subset")

library(GSE5859Subset)
data(GSE5859Subset)

head(geneExpression)

dim(geneExpression)

head(sampleInfo)

dim(sampleInfo)

identical(colnames(geneExpression), sampleInfo$filename)

subset(sampleInfo, date == "2005-06-27")

dim(subset(geneAnnotation, !is.na(geneAnnotation$CHR) & geneAnnotation$CHR == "chrY"))

subset(geneAnnotation, geneAnnotation$SYMBOL == "ARPC1A")

subset(sampleInfo, sampleInfo$date == "2005-06-10")

subset(geneExpression, geneExpression$GSM136727.CEL.gz)

geneExpression[,GSM136727.CEL.gz]

my_dataframe <- as.data.frame(geneExpression)





