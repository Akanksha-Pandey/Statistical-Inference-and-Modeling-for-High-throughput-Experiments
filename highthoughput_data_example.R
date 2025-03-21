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

pid = geneAnnotation$PROBEID[which(geneAnnotation$SYMBOL== 'ARPC1A')]
samDate = sampleInfo$filename[(grep('2005-06-10', sampleInfo$date))]

geneExpression[pid,samDate]

firstMed = apply(geneExpression, 2, median)
secMed = median(firstMed)
secMed


tpval = function(e, group){
  group = as.factor(group)
  pVal = t.test(e[group==1], e[group == 0])$p.value
  return(pVal)
}

e = rnorm(20)
g0 = as.factor(sample(c(0,1), length(e), replace = T))
# t.test(e[g0==1], e[g0 == 0])$pvalue

res = tpval(e, g0)
res

g = g <- factor(sampleInfo$group)

sort(apply(geneExpression,1,tpval, g))[1]
