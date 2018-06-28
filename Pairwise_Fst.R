####################################################################################
### Script by Richie Hodel #########################################################
### richiehodel@gmail.com  #########################################################
####################################################################################

###  This script calculates pairwise FST for both species and both data types  ###

library("PopGenome")
library("hierfstat")

install.packages("apex")
library("apex")
library("adegenet")
install.packages("pegas")
library("pegas")
install.packages("mmod")
library("mmod")
install.packages("poppr")
library("poppr")

###  First RAD data

setwd("/Users/richiehodel/Documents/mangroves/pyrad_2017/")

###  Red mangrove

setwd("/Users/richiehodel/Documents/mangroves/pyrad_2017/")
GENOME.class_rhiman <- readData("vcf", format="VCF", FAST = TRUE, SNP.DATA = TRUE)

GENOME.class <- readData("vcf", format="VCF", FAST = TRUE, SNP.DATA = TRUE)

#first way to classify pops -- by location
GENOME.class_rhiman <- set.populations(GENOME.class_rhiman, list(c("DBHBa_R10", "DBHBa_R12", "DBHBa_R2", "DBHBa_R4", "DBHBa_R6", "DBHBa_R8"), 
                                                                 c( "LucBa_R10", "LucBa_R12", "LucBa_R2", "LucBa_R6", "LucBa_R8"), c("MlbFl", 
                                                                                                                                     "MlbFl_F13", "MlbFl_F14", "MlbFl_F15", "MlbFl_R10", "MlbFl_R3"), 
                                                                 c("EgCFl", "EgCFl_R2", "EgCFl_R3", "EgCFl_R4", "EgCFl_R5", "EgCFl_R6"), c("FlmFl", 
                                                                                                                                           "FlmFl_R2", "FlmFl_R3", "FlmFl_R4", "FlmFl_R5", "FlmFl_R6"), c("NPRFl_F10",
                                                                                                                                                                                                          "NPRFl_F11", "NPRFl_F12", "NPRFl_R3", "NPRFl_R5", "NPRFl_R9"),
                                                                 c( "KyWFl_F17", "KyWFl_F18", "KyWFl_R4", "KyWFl_R5", "KyWFl_R6"),
                                                                 c("GfCPR", "GfCPR_R2", "GfCPR_R3", "GfCPR_R4", "GfCPR_R5", "LuqPR"), c("LAEGr_R10", 
                                                                                                                                        "LAEGr_R8", "LNPGr", "LNPGr_R3", "LPoGr_R5", "LWoGr_R6"), c("NECSM", "NECSM_R2", 
                                                                                                                                                                                                    "NECSM_R3"), c("NWCAg", "NWCAg_R2", "NWCAg_R3", "NWCAg_R4", "NWCAg_R5"),  
                                                                 c( "SCHAn_R12", "SCHAn_R14", "SCHAn_R16", "SCHAn_R17", "SCHAn_R18", "SCHAn_R20"),
                                                                 c("CpcHo", "CpcHo_R2"), c("CrbPa", "HBRCR", "HBRCR_R2"), c("ManCR", "ManCR_R10", 
                                                                                                                            "ManCR_R3", "ManCR_R6", "ManCR_R8"), c("KtaNi", "NACBe", "NACBe_R2", "NACBe_R3", 
                                                                                                                                                                   "NACBe_R4", "NACBe_R5"), c("YucMx", "YucMx_R2", "YucMx_R3", "YucMx_R4"),
                                                                 c("APBCo", "ArACo","PlMCo", "PlmCo_R2"), c("BALTo", "LgSVz","SBcGu"), 
                                                                 c("MaHAr_R12", "MaHAr_R15", 
                                                                   "SpLAr", "SpLAr_R11", "SpLAr_R6"),
                                                                 c("CMWCI", "CMWCI_R10", "CMWCI_R3", "CMWCI_R5", "CMWCI_R6", "CMWCI_R8"), c("MaBJa", 
                                                                                                                                            "MaBJa_R10", "MaBJa_R3", "MaBJa_R5", "MaBJa_R6", "MaBJa_R8"), c("NorCu",
                                                                                                                                                                                                            "NorCu_R2", "NorCu_R3", "NorCu_R4"), c("PMRDR", "SmnDR", "StNHa"), 
                                                                 c("DdSSe", "MnoBr", "RPgBr"), c("SoWCR", "SoWCR_R2", "SoWCR_R3", "SoWCR_R4", 
                                                                                                 "SoWCR_R5")), diploid=TRUE)


#second way to classify pops -- by geography
GENOME.class <- set.populations(GENOME.class, list(c("DBHBa_R10", "DBHBa_R12", "DBHBa_R2", "DBHBa_R4", "DBHBa_R6", "DBHBa_R8", 
                                                     "LucBa_R10", "LucBa_R12", "LucBa_R2", "LucBa_R6", "LucBa_R8", "MlbFl", 
                                                     "MlbFl_F13", "MlbFl_F14", "MlbFl_F15", "MlbFl_R10", "MlbFl_R3"), 
                                                   c("EgCFl", "EgCFl_R2", "EgCFl_R3", "EgCFl_R4", "EgCFl_R5", "EgCFl_R6", "FlmFl", 
                                                     "FlmFl_R2", "FlmFl_R3", "FlmFl_R4", "FlmFl_R5", "FlmFl_R6", "NPRFl_F10",
                                                     "NPRFl_F11", "NPRFl_F12", "NPRFl_R3", "NPRFl_R5", "NPRFl_R9",
                                                     "KyWFl_F17", "KyWFl_F18", "KyWFl_R4", "KyWFl_R5", "KyWFl_R6"),
                                                   c("GfCPR", "GfCPR_R2", "GfCPR_R3", "GfCPR_R4", "GfCPR_R5", "LuqPR", "LAEGr_R10", 
                                                     "LAEGr_R8", "LNPGr", "LNPGr_R3", "LPoGr_R5", "LWoGr_R6", "NECSM", "NECSM_R2", 
                                                     "NECSM_R3", "NWCAg", "NWCAg_R2", "NWCAg_R3", "NWCAg_R4", "NWCAg_R5",  
                                                     "SCHAn_R12", "SCHAn_R14", "SCHAn_R16", "SCHAn_R17", "SCHAn_R18", "SCHAn_R20"),
                                                   c("CpcHo", "CpcHo_R2", "CrbPa",  "ManCR", "ManCR_R10", 
                                                     "ManCR_R3", "ManCR_R6", "ManCR_R8", "KtaNi", "NACBe", "NACBe_R2", "NACBe_R3", 
                                                     "NACBe_R4", "NACBe_R5", "YucMx", "YucMx_R2", "YucMx_R3", "YucMx_R4"),
                                                   c("APBCo", "ArACo","PlMCo", "PlmCo_R2", "BALTo", "LgSVz","SBcGu", 
                                                     "MaHAr_R12", "MaHAr_R15", 
                                                     "SpLAr", "SpLAr_R11", "SpLAr_R6"),
                                                   c("CMWCI", "CMWCI_R10", "CMWCI_R3", "CMWCI_R5", "CMWCI_R6", "CMWCI_R8", "MaBJa", 
                                                     "MaBJa_R10", "MaBJa_R3", "MaBJa_R5", "MaBJa_R6", "MaBJa_R8", "NorCu",
                                                     "NorCu_R2", "NorCu_R3", "NorCu_R4", "PMRDR", "SmnDR", "StNHa"), 
                                                   c("DdSSe", "MnoBr", "RPgBr","SoWCR", "SoWCR_R2", "SoWCR_R3", "SoWCR_R4", 
                                                     "SoWCR_R5", "HBRCR", "HBRCR_R2")), diploid=TRUE)

GENOME.class_rhiman <- F_ST.stats(GENOME.class_rhiman)

get.F_ST(GENOME.class_rhiman)

GENOME.class <- diversity.stats(GENOME.class)
GENOME.class_rhiman <- diversity.stats(GENOME.class_rhiman)

GENOME.class@nuc.F_ST.pairwise
GENOME.class@hap.F_ST.pairwise
GENOME.class_rhiman@Nei.G_ST.pairwise
GENOME.class@Nei.G_ST.pairwise

# now white mangroves 

GENOME.class <- set.populations(GENOME.class, list(  c("DBHBa_L10", "DBHBa_L12", "DBHBa_L2", "DBHBa_L4", "DBHBa_L6", "DBHBa_L8", 
                                                       "LucBa_L1", "LucBa_L3", "LucBa_L5", "LucBa_L7", "LucBa_L9", "LucBa_L11",
                                                       "MlbFl_L1", "MlbFl_L3", "MlbFl_L13", "MlbFl_P13", "MlbFl_P14", "MlbFl_P15"),
                                                     c("EgCFl_L1", "EgCFl_L3", "EgCFl_L4", "EgCFl_L6", "EgCFl_L8", "FlmFl_L4", 
                                                       "FlmFl_L5", "FlmFl_L7", "FlmFl_L9", "FlmFl_L13", "NPRFl_L9",
                                                       "NPRFl_P10", "KyWFl_L3", "KyWFl_L4", "KyWFl_L6", "KyWFl_P16", "KyWFl_P17"),
                                                     c("FtCAn_L11", "FtCAn_L14", "GCBVI_L1", " LNPGr_L1", "LNPGr_L3", "LqBPR_L1",
                                                       "LqBPR_L2", "LqBPR_L3", "LqBPR_L4", "LqBPR_L5","LqBPR_L6",  "LWoGr_L4",
                                                       "MKPAn_L15", "MKPAn_L18", "SCHAn_L21", "SCHAn_L24"),
                                                     c("ManCR_L1","ManCR_L10","ManCR_L3","ManCR_L5","ManCR_L6","TrIBe_L1"),
                                                     c("GdMCo_L1","MgHAr_L5","SpLAr_L1"),
                                                     c("MaBJa_L1", "MaBJa_L10", "MaBJa_L3", "MaBJa_L5", "MaBJa_L6", "MaBJa_L8",
                                                       "NSvCI_L1", "NSvCI_L3", "NSvCI_L5", "PkICI_L10", "PkICI_L7", "RmPCI_L11"),
                                                     c("AntBr_L1", "BdVEG_L1")), diploid=TRUE)



GENOME.class <- set.populations(GENOME.class, list(  c("DBHBa_L10", "DBHBa_L12", "DBHBa_L2", "DBHBa_L4", "DBHBa_L6", "DBHBa_L8"), 
                                                     c( "LucBa_L1", "LucBa_L3", "LucBa_L5", "LucBa_L7", "LucBa_L9", "LucBa_L11"),
                                                     c("MlbFl_L1", "MlbFl_L3", "MlbFl_L13", "MlbFl_P13", "MlbFl_P14", "MlbFl_P15"),
                                                     c("EgCFl_L1", "EgCFl_L3", "EgCFl_L4", "EgCFl_L6", "EgCFl_L8"), c( "FlmFl_L4", 
                                                                                                                       "FlmFl_L5", "FlmFl_L7", "FlmFl_L9", "FlmFl_L13"), c("NPRFl_L9",
                                                                                                                                                                           "NPRFl_L10"), c("KyWFl_L3", "KyWFl_L4", "KyWFl_L6", "KyWFl_P16", "KyWFl_P17"),
                                                     c("FtCAn_L11", "FtCAn_L14", "MKPAn_L15", "MKPAn_L18", "SCHAn_L21", "SCHAn_L24", 
                                                       "GCBVI_L1"), c("LNPGr_L1", "LNPGr_L3", "LWoGr_L4"), c("LqBPR_L1",
                                                                                                             "LqBPR_L2", "LqBPR_L3", "LqBPR_L4", "LqBPR_L5","LqBPR_L6"),  
                                                     c("ManCR_L1","ManCR_L10","ManCR_L3","ManCR_L5","ManCR_L6","TrIBe_L1"),
                                                     c("GdMCo_L1","MgHAr_L5","SpLAr_L1"),
                                                     c("MaBJa_L1", "MaBJa_L10", "MaBJa_L3", "MaBJa_L5", "MaBJa_L6", "MaBJa_L8"),
                                                     c( "NSvCI_L1", "NSvCI_L3", "NSvCI_L5", "PkICI_L10", "PkICI_L7", "RmPCI_L11"),
                                                     c("AntBr_L1", "BdVEG_L1")), diploid=TRUE)



GENOME.class <- F_ST.stats(GENOME.class)

GENOME.class <- diversity.stats(GENOME.class)

GENOME.class <- neutrality.stats(GENOME.class)


get.F_ST(GENOME.class)

GENOME.class@nuc.F_ST.pairwise
GENOME.class@hap.F_ST.pairwise
GENOME.class@Nei.G_ST.pairwise
GENOME.class@Nei.G_ST


#### Chloroplast DNA pairwise FST

##  Red mangrove

setwd("/Users/richiehodel/Documents/mangroves/genome_skimming/")

cp.GENOME.class <- readData("FASTA")

# need to define populations

cp.GENOME.class <- set.populations(cp.GENOME.class, list(c("F4", "F5", "F6", "D2", "D4", "D6", "C20", "C23", "C24"),
                                                         c("F1", "F2", "F3", "F7", "F8", "F9"),
                                                         c("B6", "B7", "B9", "B19", "B20", "B21", "B24", "C2", "C4"),
                                                         c("A7", "A9", "A18", "A19", "C13", "C15", "C16", "E23", "E24"),
                                                         c("E3", "E6", "A23", "A24", "B1"),
                                                         c("B12", "B14", "B15", "C8", "C11", "C12", "E16", "E17", "E18"),
                                                         c("E1", "C5", "C6")), diploid = FALSE)


cp.GENOME.class@populations

cp.GENOME.class <- F_ST.stats(cp.GENOME.class)

cp.GENOME.class <- diversity.stats(cp.GENOME.class)

cp.GENOME.class <- neutrality.stats(cp.GENOME.class)

cp.GENOME.class@hap.F_ST.pairwise



Rhizophora_alignment <- read.FASTA("Rhiman_aligned_50.fasta")

Rhiz <- DNAbin2genind(Rhizophora_alignment)

Rhiz$pop <- as.factor(c("S_Am","S_Am","Greater_Ant","Af_Pac","Af_Pac",
                        "Af_Pac", "Greater_Ant","Lesser_Ant", "Lesser_Ant",
                        "Greater_Ant", "C_Am", "C_Am", "E_Fl-Ba", "Lesser_Ant", 
                        "C_Am", "C_Am", "Lesser_Ant", "Greater_Ant", "Lesser_Ant",
                        "C_Am", "E_Fl-Ba", "Lesser_Ant", "W_Fl", "E_Fl-Ba",
                        "Greater_Ant", "Greater_Ant","Greater_Ant", "C_Am",
                        "E_Fl-Ba", "Lesser_Ant", "E_Fl-Ba", "C_Am",
                        "Lesser_Ant", "S_Am", "E_Fl-Ba","E_Fl-Ba", "W_Fl",
                        "Lesser_Ant", "C_Am", "W_Fl", "S_Am", "E_Fl-Ba",
                        "E_Fl-Ba", "Greater_Ant", "W_Fl", "W_Fl", "C_Am",
                        "S_Am", "W_Fl", "Greater_Ant"))

Rhiz$pop <- as.factor(c("Colombia","Colombia","DR","CR_P","Senegal",
                        "CR_P", "DR","PR", "PR",
                        "DR", "Honduras", "Honduras", "LI", "Grenada", 
                        "CR_C", "CR_C", "PR", "Cayman", "Antigua",
                        "CR_C", "Mlb", "PR", "KyW", "Mlb",
                        "Cayman", "Jamaica","Jamaica", "Mx_Gulf",
                        "LI", "Antigua", "GrBa", "Mx_C",
                        "Grenada", "Aruba", "GrBa","LI", "NPR",
                        "Grenada", "Belize", "NPR", "Aruba", "GrBa",
                        "Mlb", "Jamaica", "KyW", "NPR", "Belize",
                        "Aruba", "KyW", "Cayman"))


Rhiz$pop

holder <- diff_stats(Rhiz)

holder$global

pairwise_Gst_Nei(Rhiz)

basic.stats(Rhiz, diploid=FALSE)

##########################################################################

#### white mangrove chloroplast

##########################################################################
##########################################################################
setwd("/Users/richiehodel/Documents/mangroves/genome_skimming/")

Lagrac_alignment <- read.FASTA("Lagrac_aligned.fasta")

Lagu <- DNAbin2genind(Lagrac_alignment)

Lagu$pop <- as.factor(c("W_Fl", "E_Fl-Ba", "E_Fl-Ba", "W_Fl", "W_Fl",
                        "Af_Pac", "Lesser_Ant", "Lesser_Ant", "E_Fl-Ba", "Lesser_Ant",
                        "Lesser_Ant", "Lesser_Ant", "Lesser_Ant", "Greater_Ant",
                        "Greater_Ant", "Greater_Ant", "Lesser_Ant", "Lesser_Ant", 
                        "Lesser_Ant", "Greater_Ant", "Greater_Ant", "Greater_Ant",
                        "S_Am", "S_Am", "S_Am", "E_Fl-Ba", "E_Fl-Ba","E_Fl-Ba", "Af_Pac",
                        "W_Fl", "W_Fl", "W_Fl", "C_Am", "C_Am", "C_Am", "E_Fl-Ba",
                        "E_Fl-Ba", "E_Fl-Ba", "Af_Pac", "S_Am", "S_Am", "Greater_Ant",
                        "Greater_Ant", "Greater_Ant", "C_Am", "C_Am", "C_Am", "C_Am", 
                        "C_Am", "C_Am"))


Lagu$pop <- as.factor(c("KyW", "Mlb", "Mlb", "KyW", "KyW",
                        "Pan_P", "PR", "PR", "Mlb", "PR",
                        "Antigua", "Antigua", "Antigua", "Jamaica",
                        "Jamaica", "Jamaica", "Grenada", "Grenada", 
                        "Grenada", "Cayman", "Cayman", "Cayman",
                        "Aruba", "Aruba", "Aruba", "LI", "LI","LI", "Pan_P",
                        "NPR", "NPR", "NPR", "CR_C", "CR_C", "CR_C", "GrBa",
                        "GrBa", "GrBa", "Senegal", "Colombia", "Colombia", "DR",
                        "DR", "DR", "Honduras", "Honduras", "Belize", "Belize", 
                        "Belize", "Mexico"))

Lagu$pop

holder2 <- diff_stats(Lagu)

holder2$global

pairwise_Gst_Nei(Lagu)





setwd("/Users/richiehodel/Documents/mangroves/pyrad_2017/")
GENOME.class <- readData("nexus", format="nexus", FAST = TRUE, SNP.DATA = TRUE)

GENOME.class <- set.populations(GENOME.class, list(  c("An_FtC_Lr11","An_FtC_Lr14","An_MKP_Lr15","An_MKP_Lr18",
                                                       "An_SCH_Lr21","An_SCH_Lr24"), 
                                                     c("Ar_MgH_Lr5","Ar_SpL_Lr1","Ba_DBH_Lr10","Ba_DBH_Lr12",
                                                       "Ba_DBH_Lr2","Ba_DBH_Lr4","Ba_DBH_Lr6","Ba_DBH_Lr8"), 
                                                     c("Ba_Luc_Lr1","Ba_Luc_Lr11","Ba_Luc_Lr3","Ba_Luc_Lr5","Ba_Luc_Lr7",
                                                       "Ba_Luc_Lr9","Be_PtG_Lr1","Be_TrI_Lr1","Br_Ags_Lr1","Br_Ant_Lr1","CI_NSv_Lr1","CI_NSv_Lr3","CI_NSv_Lr5","CI_PkI_Lr10","CI_PkI_Lr7","CI_RmP_Lr11","CR_Man_Lr1","CR_Man_Lr10","CR_Man_Lr3","CR_Man_Lr5","CR_Man_Lr6","CR_Man_Lr8","Co_BdA_Lr1","Co_GdM_Lr1","Co_PrT_Lr1","Cu_PdC_Lr1","Cu_RLC_Lr1","Do_ECS_Lr1","EG_BdV_Lr1","Ec_IsP_Lr1","FG_Cay_Lr2","Fl_EgC_Lr1","Fl_EgC_Lr3","Fl_EgC_Lr4","Fl_EgC_Lr6","Fl_EgC_Lr8","Fl_Flm_Lr11","Fl_Flm_Lr13","Fl_Flm_Lr4","Fl_Flm_Lr5","Fl_Flm_Lr7","Fl_Flm_Lr9","Fl_KyW_Lr3","Fl_KyW_Lr4","Fl_KyW_Lr5","Fl_KyW_Lr6","Fl_KyW_Lr7","Fl_Mlb_Lr1","Fl_Mlb_Lr12","Fl_Mlb_Lr13","Fl_Mlb_Lr2","Fl_Mlb_Lr3","Fl_Mlb_Lr5","Fl_NPR_Lr05","Fl_NPR_Lr11","Fl_NPR_Lr14","Fl_NPR_Lr6","Fl_NPR_Lr9","Gr_LNP_Lr1","Gr_LNP_Lr3","Gr_LWo_Lr4","Ja_MaB_Lr1","Ja_MaB_Lr10","Ja_MaB_Lr3","Ja_MaB_Lr5","Ja_MaB_Lr6","Ja_MaB_Lr8","PR_LqB_Lr1","PR_LqB_Lr2","PR_LqB_Lr3","PR_LqB_Lr4","PR_LqB_Lr5","PR_LqB_Lr6","Pa_CcS_Lr1","Pa_PtC_Lr1","TC_SPt_Lr1","Tr_Cni_Lr1","Tr_FBy_Lr1","VI_GCB_Lr1","Ve_CLO_Lr1","Ve_Flc_Lr1")), diploid=FALSE)

get.individuals(GENOME.class)

GENOME.class <- F_ST.stats(GENOME.class)

GENOME.class <- diversity.stats(GENOME.class)

GENOME.class <- neutrality.stats(GENOME.class)

GENOME.class@hap.F_ST.pairwise

get.F_ST(GENOME.class)

GENOME.class@nuc.F_ST.pairwise


