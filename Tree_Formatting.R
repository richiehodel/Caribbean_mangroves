####################################################################################
### Script by Richie Hodel #########################################################
### richiehodel@gmail.com  #########################################################
####################################################################################

###  This script reads in tree files and annotates them and creates figures ###


library("ape")
source("https://bioconductor.org/biocLite.R")
biocLite("ggtree")
source("https://bioconductor.org/biocLite.R")
biocLite("Biostrings")
library("Biostrings")
library("ggplot2")
library("ggtree")
library('stringr')

setwd("/Users/richiehodel/Documents/mangroves/Caribbean_RAD/")


####


short_names <- read.table("Rhiman_single_6_b_100boots.tre", skip=7,
                          nrows=125)

short_names <- data.frame(str_split_fixed(short_names$V2, "_", 2))
short_names <- data.frame(str_split_fixed(short_names$X1, ",", 2))



MyTree <- read.nexus(file="Rhiman_single_6_b_100boots.tre")

##########################################
setwd("/Users/richiehodel/Documents/mangroves/Caribbean_RAD/")
MyTree <- read.nexus(file="Rhiman_SVD_100boots_names.tre")


#put in groups
South_America <- c(MyTree$tip.label[1], MyTree$tip.label[49], MyTree$tip.label[62:63],
                   MyTree$tip.label[99:100], MyTree$tip.label[102], MyTree$tip.label[115:117])
Greater_Antilles <- c(MyTree$tip.label[2:7], MyTree$tip.label[30:34],MyTree$tip.label[55:61],
                      MyTree$tip.label[94:98], MyTree$tip.label[109], MyTree$tip.label[118])
Central_America <- c(MyTree$tip.label[8:10], MyTree$tip.label[35:37], MyTree$tip.label[64:68],
                     MyTree$tip.label[76:80], MyTree$tip.label[110:114], MyTree$tip.label[119:122])
Florida_Bahamas <- c(MyTree$tip.label[11:16], MyTree$tip.label[18:29], MyTree$tip.label[38:42],
                     MyTree$tip.label[50:54], MyTree$tip.label[69:74], MyTree$tip.label[84:88])
Africa_Brazil <- c(MyTree$tip.label[17], MyTree$tip.label[75], MyTree$tip.label[101])
Lesser_Antilles <- c(MyTree$tip.label[43:48], MyTree$tip.label[81:83],MyTree$tip.label[89:93],
                     MyTree$tip.label[103:108])


groups <- list(South_America=c(South_America[1:10]), Greater_Antilles=c(Greater_Antilles[1:25]),
               Central_America=c(Central_America[1:25]), Florida_Bahamas=c(Florida_Bahamas[1:39]),
               Africa_Brazil=c(Africa_Brazil[1:3]),Lesser_Antilles=c(Lesser_Antilles[1:20]))

MyTree <- groupOTU(MyTree, groups)



ggtree(MyTree, aes(color=group),  branch.length = "none") + geom_tiplab(size=1.5, color="black") +
  scale_color_manual(values=c("darkgrey", "red","darkorange1",  "green", "purple", "blue"),
                     labels=c(
                       "Africa/Brazil","Central America","Florida/Bahamas","Greater Antilles",
                       "Lesser Antilles", "South America")) + 
  # ggtitle("Rhizophora RAD-Seq") + theme(plot.title = element_text(hjust=0.5)) +
  geom_label2(aes(label=branch.length, subset=branch.length>70 & !isTip) , color="black", size=2) +
  theme(plot.margin=unit(c(2,2,2,2),"cm")) + theme(legend.position=c(.1,.8)) + labs(color="Region")  
ggsave("SVD_rhiman.eps", width=15, height=10, dpi = 900)


##### Now white mangrove #####

##################################################################################

MyTree2 <- read.nexus(file="Lagrac_SVD_100boots.tre")

#put in groups

Florida_Bahamas2 <- c(MyTree2$tip.label[1:19], MyTree2$tip.label[28:33],
                      MyTree2$tip.label[43:48])

Lesser_Antilles2 <- c(MyTree2$tip.label[20:27], MyTree2$tip.label[34],
                      MyTree2$tip.label[51:52]) 

Greater_Antilles2 <- c(MyTree2$tip.label[35:36], MyTree2$tip.label[49:50])

Central_America2 <- c(MyTree2$tip.label[37:41], MyTree2$tip.label[54]) 

South_America2 <- c(MyTree2$tip.label[42], MyTree2$tip.label[53])



groups <- list(South_America=c(South_America2[1:2]), Greater_Antilles=c(Greater_Antilles2[1:4]),
               Central_America=c(Central_America2[1:6]), Florida_Bahamas=c(Florida_Bahamas2[1:31]),
               Lesser_Antilles=c(Lesser_Antilles2[1:10]))
groups

MyTree2 <- groupOTU(MyTree2, groups)

ggtree(MyTree2, aes(color=group),  branch.length = "none") + geom_tiplab(size=1.5, color="black") +
  scale_color_manual(values=c("red", "darkorange1", "green",  "purple", "blue"), labels=
                       "Africa/Brazil","Central America","Florida/Bahamas","Greater Antilles",
                     "Lesser Antilles", "South America") + 
  ggtitle("") + theme(plot.title = element_text(hjust=0.5)) +
  geom_label2(aes(label=branch.length, subset=branch.length>70 & !isTip) , color="black", size=2) +
  theme(plot.margin=unit(c(2,2,2,2),"cm")) + theme(legend.position=c(.1,.8)) + labs(color="Region") 

ggsave("laggy.eps", width=15, height=10, dpi = 900)




