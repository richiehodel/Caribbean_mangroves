####################################################################################
### Script by Richie Hodel #########################################################
### richiehodel@gmail.com  #########################################################
####################################################################################

###  This script searches against databases for contamination  ###
library("stringr")
setwd("/Users/richiehodel/Documents/mangroves/Caribbean_RAD/")

### read in fasta file, then reduce it so that there is 
### only one sequence per locus

### first for red mangroves

fasta <- read.table(file="Rhiman_single_5.fasta", sep=" ", fill=TRUE)
fasta$V2 <- NULL

odds <- seq(1,nrow(fasta),2)
evens <- seq(2,nrow(fasta),2)

fasta_new <- data.frame(fasta[odds,])
fasta_new <- data.frame(str_split_fixed(fasta_new$fasta.odds..., "_Sample_", 2))
fasta_new$X2 <- NULL
fasta_new$X2 <- fasta[evens,]

fasta_newer <- subset(fasta_new, !duplicated(fasta_new$X1))

### print out fasta file

write.table(fasta_newer, file="all_loci.fasta", quote=FALSE, sep="\n", row.names=FALSE,
            col.names=FALSE)

###  this file is used to search against databases for contamination  ###

### remove Homo sapiens hits

human <- read.table(file="human.tabular")
human_hits <- data.frame(str_split_fixed(human$V1, "_", 2))
human_hits$X1 <- "X"
human_hits$combined <- paste(human_hits$X1, human_hits$X2, sep="")
human_loci <- unique(human_hits$combined)

human_removed <- working[, !colnames(working) %in% human_loci]

### remove kraken microbial hits

kraken <- read.table(file="classified.txt", sep="_", fill=TRUE)

deletions <- seq(2,nrow(kraken),2)
kraken[deletions,] <- 'NA'
kraken <- na.omit(kraken)
kraken$V1 <- c("X")
kraken$combined <- paste(kraken$V1, kraken$V2, sep="")

microbial <- unique(kraken$combined)

microbial_human_removed <- human_removed[, !colnames(human_removed) %in% microbial]

###  now remove hits of fungal/microbial origin

contaminants <- read.table(file="contaminants.tabular", sep="\t")

contaminant_hits <- data.frame(str_split_fixed(contaminants$V1, "_", 2))
contaminant_hits$X1 <- "X"
contaminant_hits$combined <- paste(contaminant_hits$X1, contaminant_hits$X2, sep="")
contaminant_loci <- unique(contaminant_hits$combined)

contaminant_microbial_human_removed <- microbial_human_removed[, 
            !colnames(microbial_human_removed) %in% contaminant_loci]

working <- contaminant_microbial_human_removed

write.table(working, file="Rhiman_5_filtered.txt", quote=F,
            row.names = F, col.names = F)


### now for white mangroves

fasta <- read.table(file="Lagrac_single_6.fasta", sep=" ", fill=TRUE)
fasta$V2 <- NULL

odds <- seq(1,nrow(fasta),2)
evens <- seq(2,nrow(fasta),2)

fasta_new <- data.frame(fasta[odds,])
fasta_new <- data.frame(str_split_fixed(fasta_new$fasta.odds..., "_Sample_", 2))
fasta_new$X2 <- NULL
fasta_new$X2 <- fasta[evens,]

fasta_newer <- subset(fasta_new, !duplicated(fasta_new$X1))

### print out fasta file

write.table(fasta_newer, file="all_loci.fasta", quote=FALSE, sep="\n", row.names=FALSE,
            col.names=FALSE)

###  this file is used to search against databases for contamination  ###

### remove Homo sapiens hits

human <- read.table(file="human.tabular")
human_hits <- data.frame(str_split_fixed(human$V1, "_", 2))
human_hits$X1 <- "X"
human_hits$combined <- paste(human_hits$X1, human_hits$X2, sep="")
human_loci <- unique(human_hits$combined)

human_removed <- working[, !colnames(working) %in% human_loci]

### remove kraken microbial hits

kraken <- read.table(file="classified.txt", sep="_", fill=TRUE)

deletions <- seq(2,nrow(kraken),2)
kraken[deletions,] <- 'NA'
kraken <- na.omit(kraken)
kraken$V1 <- c("X")
kraken$combined <- paste(kraken$V1, kraken$V2, sep="")

microbial <- unique(kraken$combined)

microbial_human_removed <- human_removed[, !colnames(human_removed) %in% microbial]

###  now remove hits of fungal/microbial origin

contaminants <- read.table(file="contaminants.tabular", sep="\t")

contaminant_hits <- data.frame(str_split_fixed(contaminants$V1, "_", 2))
contaminant_hits$X1 <- "X"
contaminant_hits$combined <- paste(contaminant_hits$X1, contaminant_hits$X2, sep="")
contaminant_loci <- unique(contaminant_hits$combined)

contaminant_microbial_human_removed <- microbial_human_removed[, 
                                                               !colnames(microbial_human_removed) %in% contaminant_loci]

working <- contaminant_microbial_human_removed

write.table(working, file="Lagrac_6_filtered.txt", quote=F,
            row.names = F, col.names = F)