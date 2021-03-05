# Title: Epigenetic alterations at distal enhancers are linked to proliferation in human breast cancer

# Authors:
# Jørgen Ankill, Miriam Ragle Aure, Sunniva Bjørklund, Severin Langberg, OSBREAC, Xavier Tekpli,
# Valeria Vitelli, Vessela Kristensen, Thomas Fleischer.

# Contact information:
# Jørgen Ankill 
# jorgen.ankill2@rr-research.no

######################################################################################################################################################################################################################################################################
# -- Generate example data
######################################################################################################################################################################################################################################################################

install.packages("UCSCXenaTools")

library("UCSCXenaTools")

# Load expression data
XenaGenerate(subset=XenaCohorts=="TCGA Breast Cancer (BRCA)") %>%
	XenaFilter(filterDatasets="HiSeqV2") -> to_do
XenaQuery(to_do) %>%
	XenaDownload() -> xe_download 
me <- XenaPrepare(xe_download)

tmp <- data.frame(me$HiSeqV2.gz)
rownames(tmp) <- tmp$sample
tmp <- tmp[,!colnames(tmp)=="sample"]
colnames(tmp) <- gsub(".","-",colnames(tmp),fixed=TRUE)
tmp.me <- tmp

# Load methylation data
XenaGenerate(subset=XenaCohorts=="TCGA Breast Cancer (BRCA)") %>%
	XenaFilter(filterDatasets="HumanMethylation450") -> to_do
XenaQuery(to_do) %>%
	XenaDownload() -> xe_download 
mm <- XenaPrepare(xe_download)

tmp <- data.frame(mm)
rownames(tmp) <- tmp$sample
tmp <- tmp[,!colnames(tmp)=="sample"]
colnames(tmp) <- gsub(".","-",colnames(tmp),fixed=TRUE)
tmp.mm <- tmp

# Load clinical data
XenaGenerate(subset=XenaCohorts=="TCGA Breast Cancer (BRCA)") %>%
	XenaFilter(filterDatasets="clinical") -> to_do
XenaQuery(to_do) %>%
	XenaDownload() -> xe_download 
cli <- XenaPrepare(xe_download)

tmp <- data.frame(cli)
tmp <- tmp[tmp$sample_type=="Primary Tumor",]
sampleinfo <- tmp

# Extract 100 random example samples
sampleinfo <- sampleinfo[sampleinfo$sampleID%in%intersect(colnames(tmp.mm),colnames(tmp.me)),]
set.seed(53)
sampleinfo <- sampleinfo[sample(c(1:nrow(sampleinfo)),size=100,replace=FALSE),]

tmp.mm <- tmp.mm[complete.cases(tmp.mm),]
tmp.me <- tmp.me[,colnames(tmp.me)%in%sampleinfo$sampleID]
mm <- tmp.mm[,colnames(tmp.mm)%in%sampleinfo$sampleID]
me <- tmp.me[,match(colnames(mm),colnames(tmp.me))]

# Select 10000 random CpGs and 100000 random CpGs
mm <- mm[sample(c(1:nrow(mm)),size=100000,replace=FALSE),]
me <- me[sample(c(1:nrow(me)),size=10000,replace=FALSE),]

######################################################################################################################################################################################################################################################################
# -- emQTL analysis
######################################################################################################################################################################################################################################################################

#Keep samples with both DNA methylation and gene expresion data
mm <- mm[,intersect(colnames(mm),colnames(me))]
me <- me[,intersect(colnames(mm),colnames(me))]

#Order tumor samples
me <- me[,match(colnames(mm),colnames(me))]

#Remove CpGs and genes with little or no variance
iqr <- apply(mm,1,IQR)
mm  <- mm[iqr>0.1,]

iqr <- apply(me,1,IQR)
me  <- me[iqr>0,]

#Calculate the correlation coefficients
r <- cor(t(me),t(mm))

#Calculate p-values from correlation coefficients
n <- ncol(me)
t <- r*sqrt(n-2)
t = t/sqrt(1-r^2)
df <- n-2
p <- 2*pt(abs(t), df, lower.tail=F)

#Keep all CpGs and genes with at least one significant CpG-gene association
m <- p
pcut <- 0.05/(as.numeric(nrow(m))*as.numeric(ncol(m)))

rowsums <- rowSums(m < pcut) !=0
colsums <- colSums(m < pcut) !=0
m <- m[rowsums,colsums]

#Obtain matrix with correlation coefficients
r <- r[rownames(r)%in%rownames(m),colnames(r)%in%colnames(m)]
r <- t(r)
r <- r*-1

write.table(r,"emQTL correlation coefficients.csv",quote=FALSE,sep=",",row.names=TRUE,col.names=TRUE)