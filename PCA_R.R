library(adegenet)
library(vcfR)
library(pegas)
library(StAMPP)
library(ade4)
library(MASS)
library(tidyverse)
library(adegraphics)
# Set working directory
setwd("C:/Users/Tom/Desktop/levi_group/All_except_big_vcf/All_except_big_vcf/4dg_VCF")

# Import VCF
vcf <- read.vcfR("C:/Users/Tom/Desktop/levi_group/All_except_big_vcf/All_except_big_vcf/4dg_VCF/reheadered_4dg_dips.clean_BI.ann.vcf")
options(warn=1)


aa.genlight <- vcfR2genlight(vcf, n.cores=1) 
locNames(aa.genlight) <- paste(vcf@fix[,1],vcf@fix[,2],sep="_") # add real SNP.names 
pop(aa.genlight)<-substr(indNames(aa.genlight),1,3) # add pop names: here "population" (group) names are first 3 chars of ind name 


pca.1 <- glPca(aa.genlight, nf=300, n.cores=1) 
scatter(pca.1)  # plot scatter with the ind labels 
pca.1$eig[1]/sum(pca.1$eig) # proportion of variation explained by 1st axis 
pca.1$eig[2]/sum(pca.1$eig) # proportion of variation explained by 2nd axis 
pca.1$eig[3]/sum(pca.1$eig) # proportion of variation explained by 3rd axis
# Print all 
print((pca.1$eig)/sum(pca.1$eig) * 100)

# Save fig 
pdf ("PCA_all_SNPs_ax12_1K_less2.pdf", width=14, height=7)

# Generate PCA plot with labels 
g1 <- s.class(pca.1$scores, pop(aa.genlight),  xax=1, yax=2, ppoints.col = factor(aa.genlight$pop), ellipseSize=0, starSize=0, ppoints.cex=4, paxes.draw=T, pgrid.draw =F, plot = FALSE)
g2 <- s.label(pca.1$scores, xax=1, yax=2, ppoints.col = factor(aa.genlight$pop), plabels = list(box = list(draw = FALSE), 
                                                                               optim = TRUE), paxes.draw=T, pgrid.draw =F, plabels.cex=1, plot = FALSE)
dev.off()



