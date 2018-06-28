####################################################################################
### Script by Richie Hodel #########################################################
### richiehodel@gmail.com  #########################################################
####################################################################################

###  This script computes PCAs from VCF files


source("http://bioconductor.org/biocLite.R")
biocLite("gdsfmt")
biocLite("SNPRelate")

library("gdsfmt")
library("SNPRelate")

library(vegan)
library(ade4)
library(MASS)

getwd()
setwd("/Users/richiehodel/Documents/mangroves/Caribbean_RAD/final_files/")



vcf_Rhiman <- "Rhiman_single_5_122inds.vcf"
snpgdsVCF2GDS(vcf_Rhiman, "Rhiman_122P.gds", method="biallelic")
snpgdsSummary("Rhiman_122P.gds")
genofile_RP <- snpgdsOpen("Rhiman_122P.gds")
print(genofile_RP)


vcf_Rhiman <- "Rhiman_single_5_122inds.vcf"
snpgdsVCF2GDS(vcf_Rhiman, "Rhiman_122a.gds", method="biallelic")
snpgdsSummary("Rhiman_122a.gds")
genofile_R <- snpgdsOpen("Rhiman_122a.gds")
print(genofile_R)

vcf_Rhiman_noP <- "Rhiman_single_5_114inds_no_Pacific.vcf"
snpgdsVCF2GDS(vcf_Rhiman_noP, "Rhiman_114noP.gds", method="biallelic")
snpgdsSummary("Rhiman_114noP.gds")
genofile_R_noP <- snpgdsOpen("Rhiman_114noP.gds")
print(genofile_R_noP)


########    4     #########################
vcf_Rhiman <- "/Users/richiehodel/Documents/mangroves/Caribbean_RAD/Rhiman_single_5_p4.vcf"
snpgdsVCF2GDS(vcf_Rhiman, "Rhiman_p4.gds", method="biallelic")
snpgdsSummary("Rhiman_p4.gds")
genofile <- snpgdsOpen("Rhiman_p4.gds")
print(genofile)
###########################################

########    14     #########################
vcf_Rhiman <- "/Users/richiehodel/Documents/mangroves/Caribbean_RAD/Rhiman_single_5_p14.vcf"
snpgdsVCF2GDS(vcf_Rhiman, "Rhiman_p14.gds", method="biallelic")
snpgdsSummary("Rhiman_p14.gds")
genofile <- snpgdsOpen("Rhiman_p14.gds")
print(genofile)
###########################################

########    24     #########################
vcf_Rhiman <- "/Users/richiehodel/Documents/mangroves/Caribbean_RAD/Rhiman_single_5_p24.vcf"
snpgdsVCF2GDS(vcf_Rhiman, "Rhiman_p24.gds", method="biallelic")
snpgdsSummary("Rhiman_p24.gds")
genofile <- snpgdsOpen("Rhiman_p24.gds")
print(genofile)
###########################################

########    34     #########################
vcf_Rhiman <- "/Users/richiehodel/Documents/mangroves/Caribbean_RAD/Rhiman_single_5_p34.vcf"
snpgdsVCF2GDS(vcf_Rhiman, "Rhiman_p34.gds", method="biallelic")
snpgdsSummary("Rhiman_p34.gds")
genofile <- snpgdsOpen("Rhiman_p34.gds")
print(genofile)
###########################################
########    44     #########################
vcf_Rhiman <- "/Users/richiehodel/Documents/mangroves/Caribbean_RAD/Rhiman_single_5_p44.vcf"
snpgdsVCF2GDS(vcf_Rhiman, "Rhiman_p44b.gds", method="biallelic")
snpgdsSummary("Rhiman_p44b.gds")
genofile <- snpgdsOpen("Rhiman_p44b.gds")
print(genofile)
###########################################
########    54     #########################
vcf_Rhiman <- "/Users/richiehodel/Documents/mangroves/Caribbean_RAD/Rhiman_single_5_p54.vcf"
snpgdsVCF2GDS(vcf_Rhiman, "Rhiman_p54a.gds", method="biallelic")
snpgdsSummary("Rhiman_p54a.gds")
genofile <- snpgdsOpen("Rhiman_p54a.gds")
print(genofile)
###########################################


########    64     #########################
vcf_Rhiman <- "/Users/richiehodel/Documents/mangroves/Caribbean_RAD/Rhiman_single_5_p64.vcf"
snpgdsVCF2GDS(vcf_Rhiman, "Rhiman_p64.gds", method="biallelic")
snpgdsSummary("Rhiman_p64.gds")
genofile <- snpgdsOpen("Rhiman_p64.gds")
print(genofile)
###########################################

# no Pacific
vcf_Rhiman <- "/Users/richiehodel/Documents/mangroves/Caribbean_RAD/5_c_noP.recode.vcf"
snpgdsVCF2GDS(vcf_Rhiman, "Rhiman.gds", method="biallelic")
snpgdsSummary("Rhiman.gds")
genofile <- snpgdsOpen("Rhiman.gds")
print(genofile)

# no Pacific 5_b
vcf_Rhiman <- "/Users/richiehodel/Documents/mangroves/Caribbean_RAD/5_b_noP.recode.vcf"
snpgdsVCF2GDS(vcf_Rhiman, "Rhiman_b.gds", method="biallelic")
snpgdsSummary("Rhiman_b.gds")
genofile <- snpgdsOpen("Rhiman_b.gds")
print(genofile)


#snpgdsVCF2GDS(vcf_Rhiman, "Rhiman.gds", method="")

vcf_Lagrac <- "Lagrac_single_6_54inds.vcf"
snpgdsVCF2GDS(vcf_Lagrac, "Lagrac_a.gds", method="biallelic")
snpgdsSummary("Lagrac_a.gds")
genofile_L <- snpgdsOpen("Lagrac_a.gds")
print(genofile_L)


vcf_Lagrac <- "/Users/richiehodel/Documents/mangroves/Caribbean_RAD/Lagrac_single_6_a.vcf"
snpgdsVCF2GDS(vcf_Lagrac, "Lagrac_a.gds", method="biallelic")
snpgdsSummary("Lagrac_a.gds")
genofile <- snpgdsOpen("Lagrac_a.gds")
print(genofile)


vcf_Lagrac <- "/Users/richiehodel/Documents/mangroves/Caribbean_RAD/Lagrac_single_6_b.vcf"
snpgdsVCF2GDS(vcf_Lagrac, "Lagrac_b.gds", method="biallelic")
snpgdsSummary("Lagrac_b.gds")
genofile <- snpgdsOpen("Lagrac_b.gds")
print(genofile)

##############################################################
########################  4  #################################

vcf_Lagrac <- "/Users/richiehodel/Documents/mangroves/Caribbean_RAD/Lagrac_single_6_p4.vcf"
snpgdsVCF2GDS(vcf_Lagrac, "Lagrac_p4.gds", method="biallelic")
snpgdsSummary("Lagrac_p4.gds")
genofile <- snpgdsOpen("Lagrac_p4.gds")
print(genofile)
##############################################################
##############################################################
########################  9  #################################

vcf_Lagrac <- "/Users/richiehodel/Documents/mangroves/Caribbean_RAD/Lagrac_single_6_p9.vcf"
snpgdsVCF2GDS(vcf_Lagrac, "Lagrac_p9.gds", method="biallelic")
snpgdsSummary("Lagrac_p9.gds")
genofile <- snpgdsOpen("Lagrac_p9.gds")
print(genofile)
##############################################################
##############################################################
########################  14  ################################

vcf_Lagrac <- "/Users/richiehodel/Documents/mangroves/Caribbean_RAD/Lagrac_single_6_p14.vcf"
snpgdsVCF2GDS(vcf_Lagrac, "Lagrac_p14.gds", method="biallelic")
snpgdsSummary("Lagrac_p14.gds")
genofile <- snpgdsOpen("Lagrac_p14.gds")
print(genofile)
##############################################################
##############################################################
########################  19  ################################

vcf_Lagrac <- "/Users/richiehodel/Documents/mangroves/Caribbean_RAD/Lagrac_single_6_p19.vcf"
snpgdsVCF2GDS(vcf_Lagrac, "Lagrac_p19.gds", method="biallelic")
snpgdsSummary("Lagrac_p19.gds")
genofile <- snpgdsOpen("Lagrac_p19.gds")
print(genofile)
##############################################################
##############################################################
########################  24  ################################

vcf_Lagrac <- "/Users/richiehodel/Documents/mangroves/Caribbean_RAD/Lagrac_single_6_p24.vcf"
snpgdsVCF2GDS(vcf_Lagrac, "Lagrac_p24.gds", method="biallelic")
snpgdsSummary("Lagrac_p24.gds")
genofile <- snpgdsOpen("Lagrac_p24.gds")
print(genofile)
##############################################################
##############################################################
########################  29  ################################

vcf_Lagrac <- "/Users/richiehodel/Documents/mangroves/Caribbean_RAD/Lagrac_single_6_p29.vcf"
snpgdsVCF2GDS(vcf_Lagrac, "Lagrac_p29.gds", method="biallelic")
snpgdsSummary("Lagrac_p29.gds")
genofile <- snpgdsOpen("Lagrac_p29.gds")
print(genofile)
##############################################################
##############################################################
########################  34  ################################

vcf_Lagrac <- "/Users/richiehodel/Documents/mangroves/Caribbean_RAD/Lagrac_single_6_p34.vcf"
snpgdsVCF2GDS(vcf_Lagrac, "Lagrac_p34.gds", method="biallelic")
snpgdsSummary("Lagrac_p34.gds")
genofile <- snpgdsOpen("Lagrac_p34.gds")
print(genofile)
##############################################################


##############################################################
##############################################################


###   PCAs   ###

pca <- snpgdsPCA(genofile_RP, autosome.only = FALSE)
pc.percent <- pca$varprop*100
head(round(pc.percent, 2))

###  need to use appropriate popmap  ###

#color_list <- c("blue","black","darkorange1")

#pop_code <- scan("popmap2.txt", what=character())

sample.id <- read.gdsn(index.gdsn(genofile_RP, "sample.id"))
#pop <- cbind(sample.id, pop_code)

tab <- data.frame(sample.id = pca$sample.id,
                  EV1 = pca$eigenvect[,1],    # the first eigenvector
                  EV2 = pca$eigenvect[,2],    # the second eigenvector
                  stringsAsFactors = FALSE)
head(tab)

write.table(tab, file="Rhiman_PCA_122ind_P.txt", quote=FALSE, 
            row.names = FALSE)

pop_code <- as.factor(pop_code)

tab$pop <- pop_code

###  need to change title and file name  ###

setEPS()
postscript('pca.eps')

plot(tab$EV2, tab$EV1,  main="Rhiman 5c RAD Loci", #col=color_list[as.integer(tab$pop)],
     xlab="Eigenvector 2", ylab="Eigenvector 1",
     xlim=c(-0.5,0.5), ylim=c(-0.5,0.5))
legend("topright", legend=levels(tab$pop), pch="o", col=c("blue","black","darkorange1"), cex=1)

dev.off()

###   PCAs   ###

pca <- snpgdsPCA(genofile_L, autosome.only = FALSE)
pc.percent <- pca$varprop*100
head(round(pc.percent, 2))


sample.id <- read.gdsn(index.gdsn(genofile_L, "sample.id"))

tab <- data.frame(sample.id = pca$sample.id,
                  EV1 = pca$eigenvect[,1],    # the first eigenvector
                  EV2 = pca$eigenvect[,2],    # the second eigenvector
                  stringsAsFactors = FALSE)
head(tab)

write.table(tab, file="Lagrac_PCA_54ind.txt", quote=FALSE, 
            row.names = FALSE)

