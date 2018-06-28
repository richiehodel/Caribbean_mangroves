####################################################################################
### Script by Richie Hodel #########################################################
### richiehodel@gmail.com  #########################################################
####################################################################################

###  This script performs Mantel tests, partial Mantel tests, and Procrustes
###  analyses

library('vegan')
library('ggplot2')
install.packages("ggmap")
library('ggmap')
library('maps')
install.packages('mapdata')
library('mapdata')

###################################################################

setwd("/Users/richiehodel/Documents/mangroves/Caribbean_RAD/ocean_current_files/")

## red nuclear begin

red_geo <- read.csv(file="GPS_Feb1_2018_red_RAD.csv")
red_geo_mat <- dist(red_geo)
red_geo_mat <- as.matrix(red_geo_mat)
red_geo_mat <- data.frame(red_geo_mat)

red_genetic <- read.csv(file="red_nuc_fst_ocean2.csv")
red_genetic$X <- NULL

mantel(red_genetic, red_geo_mat, permutations = 999)
#Mantel statistic r: 0.426 
#Significance: 0.01 

red_ocean <- data.frame(mat_avg_1)

# these variables come from Ocean.R script
mat_avg_1
mat_avg_2
mat_sum_1
mat_sum_2


red_nuc_partial_avg1 <- mantel.partial(red_genetic, red_ocean, red_geo_mat,  method="pearson", permutations=999)
red_nuc_partial_sum1 <- mantel.partial(red_genetic, red_ocean, red_geo_mat,  method="pearson", permutations=999)

mantel(red_genetic, red_ocean, permutations = 999)
#Mantel statistic r: 0.1258 
#Significance: 0.046 

red_nuc_partial_avg1
#> red_nuc_partial_avg1$signif
#[1] 0.001
#> red_nuc_partial_avg1$statistic
#[1] 0.2423504

red_nuc_partial_sum1
#Mantel statistic r: 0.2626 
#Significance: 0.001 


###########################################################################
#  red nuclear end
###########################################################################
#  white nuclear begin

white_geo <- read.csv(file="GPS_Feb2_2018_white_RAD.csv")
white_geo_mat <- dist(white_geo)
white_geo_mat <- as.matrix(white_geo_mat)
white_geo_mat <- data.frame(white_geo_mat)

white_genetic <- read.csv(file="white_nuc_fst_ocean2.csv")
white_genetic$X <- NULL

mantel(white_genetic, white_geo_mat, permutations = 999)
#Mantel statistic r: 0.6935 
#Significance: 0.001 

# change var in data.frame(######) as needed
white_ocean <- data.frame(mat_avg_1)
mat_avg_1
mat_avg_2
mat_sum_1
mat_sum_2


white_nuc_partial_avg1 <- mantel.partial(white_genetic, white_ocean, white_geo_mat,  method="pearson", permutations=999)
white_nuc_partial_avg2 <- mantel.partial(white_genetic, white_ocean, white_geo_mat,  method="pearson", permutations=999)
white_nuc_partial_sum1 <- mantel.partial(white_genetic, white_ocean, white_geo_mat,  method="pearson", permutations=999)
white_nuc_partial_sum2 <- mantel.partial(white_genetic, white_ocean, white_geo_mat,  method="pearson", permutations=999)

mantel(white_ocean, white_genetic, permutations = 999)
#Mantel statistic r: 0.275 
#Significance: 0.011 

white_nuc_partial_avg1
#Mantel statistic r: 0.2494 
#Significance: 0.021 

white_nuc_partial_sum1
#Mantel statistic r: 0.2622 
#Significance: 0.045 

###########################################################################
#  white nuclear end
###########################################################################


setwd("/Users/richiehodel/Documents/mangroves/Caribbean_RAD/")
raw_data <- read.csv("Lagrac_PCA_GPS_6_a.csv")
raw_data <- read.csv("PCA+GPS_Lagrac.csv")

PCA_axes <- data.frame(raw_data$EV1, raw_data$EV2)

lat_lon <- data.frame(raw_data$lat, raw_data$lon)

result <- procrustes(X=lat_lon, Y=PCA_axes,  scale=T, symmetric=F)
result_sig <- protest(X=lat_lon, Y= PCA_axes, permutations=10000)


df_l <- data.frame(result$X, result$Y)
df_l <- cbind(df_l, raw_data$pop)
df_l$pop <- df_l$`raw_data$pop`
df_l$Location <- df_l$pop
df_l$pop <- NULL
df_l$`raw_data$pop` <- NULL

summary(result)
#Translation of averages:
# 21.19529 -76.43258

df_l_triangles <- rbind(df_l[1,],df_l[4,],df_l[6,],df_l[7,],df_l[9,],df_l[14,],
                        df_l[19,],df_l[23,],df_l[29,],df_l[31,],df_l[33,],
                        df_l[37,],df_l[43,],df_l[47,],df_l[49,])

w2hr <- map_data("world")

ggplot()  +
  geom_polygon(data=w2hr, aes(x=long, y = lat, group = group)) + 
  coord_fixed(xlim=c(-98,-53), ylim=c(5,30))+
  
  geom_segment(data=df_l, aes(x=raw_data.lon-76.43258, 
                              y=raw_data.lat+21.19529, xend=X2-76.43258, 
                              yend=X1+21.19529), 
               arrow=arrow(length=unit(0.2,"cm")))+
  
  geom_point(data=df_l, aes(x=X2-76.43258,y=X1+21.19529, 
                            fill=Location), shape=21, cex=2) +
  
  geom_point(data=df_l_triangles, aes(x=(raw_data.lon-76.43258),
                                      y=(raw_data.lat+21.19529),fill=Location), shape=24,cex=3.5) +
  
  ggtitle("White mangrove Procrustes errors") +
  scale_fill_manual(values=c("#911eb4",
                             "#0082c8", "#e6194b","#d2f53c", "#f032e6",
                             "#f58231", "#800000",  "#B8860B",  "#3cb44b",
                             "#136572", "#FFFF99","#ffe119", "#fabebe",
                             "#ffd8b1","#00CED1"), 
                    labels=c("Antigua","Aruba",
                             "Belize", "Cayman Islands", "Costa Rica", "Everglades City",
                             "Flamingo", "Grand Bahama", "Grenada", "Jamaica", "Key West",
                             "Long Island", "Melbourne", "New Port Richey", "Puerto Rico"),
                    guide=guide_legend(ncol=1))+
  xlab ("Latitude (degrees)") + ylab("Longitude (degrees)")

ggsave("lag_procrustes_map.eps", width=10, height=7, dpi = 300)


####################################################################################
####################################################################################


####### red mangroves ##################################################

raw_data_r <- read.csv("PCA+GPS_Rhiman_noP.csv")
raw_data_r <- na.omit(raw_data_r)


PCA_axes_r <- data.frame(raw_data_r$EV1, raw_data_r$EV2)

lat_lon_r <- data.frame(raw_data_r$lat, raw_data_r$lon)

result_r <- procrustes(X=lat_lon_r, Y=PCA_axes_r, scale=T, symmetric = F)

result_r_sig <- protest(X=lat_lon_r, Y=PCA_axes_r, permutations = 10000)

df_r <- data.frame(result_r$X, result_r$Y)
df_r <- cbind(df_r, raw_data_r$location)
df_r$Location <- df_r$`raw_data_r$location`
df_r$`raw_data_r$location` <- NULL

summary(result_r)
#19.30012 -74.69931

df_r_triangles <- rbind(df_r[1,],df_r[6,],df_r[12,],df_r[17,],df_r[22,],
                        df_r[24,],df_r[30,],df_r[32,],df_r[37,],df_r[41,],
                        df_r[47,],df_r[53,],df_r[58,],df_r[64,],df_r[65,],
                        df_r[68,],df_r[70,],df_r[76,],df_r[81,],df_r[87,],
                        df_r[93,],df_r[97,],df_r[102,],df_r[103,],df_r[109,],
                        df_r[112,],df_r[113,],df_r[114,])

df_r_triangles[1,1:2] <- c(-0.705585,12.01419)

ggplot()  +
  geom_polygon(data=w2hr, aes(x=long, y = lat, group = group)) + 
  coord_fixed(xlim=c(-98,-13), ylim=c(-5,30))+
  
  geom_segment(data=df_r, aes(x=raw_data_r.lon-74.69931, 
                              y=raw_data_r.lat+19.30012, xend=X2-74.69931, 
                              yend=X1+19.30012), 
               arrow=arrow(length=unit(0.2,"cm")))+
  geom_point(data=df_r, aes(x=X2-74.69931,y=X1+19.30012, 
                            fill=Location), shape=21, cex=2) +
  geom_point(data=df_r_triangles, aes(x=(raw_data_r.lon-74.69931),
                                      y=(raw_data_r.lat+19.30012),fill=Location), shape=24,cex=3.5) +
  ggtitle("Red mangrove Procrustes errors") +
  
  scale_fill_manual(values=c("navy",
                             "#911eb4",
                             "#0082c8",
                             "#e6194b",
                             "#D8BFD8",
                             "#d2f53c",
                             "blue",
                             "darkblue",
                             "palegoldenrod",
                             "#f58231",
                             "#800000",
                             "#B8860B",
                             "#3cb44b",
                             "turquoise",
                             "darkgray",
                             "#e25822",
                             "#136572",
                             "#FFFF99",
                             "#ffe119",
                             "#fabebe",
                             "#ff1694",
                             "#ffd8b1",
                             "maroon",
                             "#00CED1",
                             "#00FF00",
                             "white",
                             "#556b2f",
                             "#4B0082"), 
                    labels=c("Anguilla",
                             "Antigua",
                             "Aruba",
                             "Belize",
                             "Brazil",
                             "Cayman Islands",
                             "Colombia",
                             "Costa Rica",
                             "Cuba",
                             "Everglades City",
                             "Flamingo",
                             "Grand Bahama",
                             "Grenada",
                             "Guyana",
                             "Hispaniola",
                             "Honduras",
                             "Jamaica",
                             "Key West",
                             "Long Island",
                             "Melbourne",
                             "Mexico",
                             "New Port Richey",
                             "Nicaragua",
                             "Puerto Rico",
                             "Saint Martin",
                             "Senegal",
                             "Tobago",
                             "Venezuela"))+
  xlab ("Latitude (degrees)") + ylab("Longitude (degrees)")

ggsave("rhiz_procrustes_map_all.eps", width=10, height=7, dpi = 300)





###################################################################
###################################################################
###################################################################
###################################################################
# Red mangroves without 4 pops
###################################################################

df_r2 <- subset(df_r, df_r$Location!="Senegal" &
                  df_r$Location!="Brazil" &
                  df_r$Location!="Grenada" &
                  df_r$Location!="Guyana" )

df_r2_triangles  <- subset(df_r_triangles, df_r_triangles$Location!="Senegal" &
                             df_r_triangles$Location!="Brazil" &
                             df_r_triangles$Location!="Grenada" &
                             df_r_triangles$Location!="Guyana" )

ggplot()  +
  geom_polygon(data=w2hr, aes(x=long, y = lat, group = group)) + 
  coord_fixed(xlim=c(-98,-53), ylim=c(5,30))+
  
  geom_segment(data=df_r2, aes(x=raw_data_r.lon-74.69931, 
                               y=raw_data_r.lat+19.30012, xend=X2-74.69931, 
                               yend=X1+19.30012), 
               arrow=arrow(length=unit(0.2,"cm")))+
  geom_point(data=df_r2, aes(x=X2-74.69931,y=X1+19.30012, 
                             fill=Location), shape=21, cex=2) +
  geom_point(data=df_r2_triangles, aes(x=(raw_data_r.lon-74.69931),
                                       y=(raw_data_r.lat+19.30012),fill=Location), shape=24,cex=3.5) +
  ggtitle("Red mangrove Procrustes errors") +
  
  scale_fill_manual(values=c("navy",
                             "#911eb4",
                             "#0082c8",
                             "#e6194b",
                             "#d2f53c",
                             "blue",
                             "darkblue",
                             "palegoldenrod",
                             "#f58231",
                             "#800000",
                             "#B8860B",
                             "darkgray",
                             "#e25822",
                             "#136572",
                             "#FFFF99",
                             "#ffe119",
                             "#fabebe",
                             "#ff1694",
                             "#ffd8b1",
                             "maroon",
                             "#00CED1",
                             "#00FF00",
                             "#556b2f",
                             "#4B0082"), 
                    labels=c("Anguilla",
                             "Antigua",
                             "Aruba",
                             "Belize",
                             "Cayman Islands",
                             "Colombia",
                             "Costa Rica",
                             "Cuba",
                             "Everglades City",
                             "Flamingo",
                             "Grand Bahama",
                             "Hispaniola",
                             "Honduras",
                             "Jamaica",
                             "Key West",
                             "Long Island",
                             "Melbourne",
                             "Mexico",
                             "New Port Richey",
                             "Nicaragua",
                             "Puerto Rico",
                             "Saint Martin",
                             "Tobago",
                             "Venezuela"),
                    guide=guide_legend(ncol=1))+
  xlab ("Latitude (degrees)") + ylab("Longitude (degrees)")

ggsave("rhiz_procrustes_map_central.eps", width=10, height=7, dpi = 300)


###################################################################
###################################################################
###################################################################
###################################################################
###################################################################

####### Rhiman including Pacific ##################################

raw_data_r <- read.csv("PCA+GPS_Rhiman_P.csv")

raw_data_r <- na.omit(raw_data_r)

PCA_axes_r <- data.frame(raw_data_r$EV1, raw_data_r$EV2)

lat_lon_r <- data.frame(raw_data_r$lat, raw_data_r$lon)

result_r <- procrustes(X=lat_lon_r, Y=PCA_axes_r, scale=T, symmetric = F)

result_r_sig <- protest(X=lat_lon_r, Y=PCA_axes_r, permutations = 10000)

df_r <- data.frame(result_r$X, result_r$Y)
df_r <- cbind(df_r, raw_data_r$pop)
df_r$Location <- df_r$`raw_data_r$pop`
df_r$`raw_data_r$pop` <- NULL

summary(result_r)
#18.63885 -75.29883

df_r_triangles <- rbind(df_r[1,],df_r[6,],df_r[12,],df_r[17,],df_r[22,],
                        df_r[24,],df_r[30,],df_r[32,],df_r[37,],df_r[44,],
                        df_r[48,],df_r[54,],df_r[60,],df_r[65,],df_r[71,],
                        df_r[72,],df_r[75,],df_r[77,],df_r[83,],df_r[88,],
                        df_r[94,],df_r[100,],df_r[104,],df_r[109,],df_r[110,],
                        df_r[111,],df_r[117,],df_r[120,],df_r[121,],df_r[122,])

#df_r_triangles[1,1:2] <- c(-0.705585,12.01419)

ggplot()  +
  geom_polygon(data=w2hr, aes(x=long, y = lat, group = group)) + 
  coord_fixed(xlim=c(-103,-13), ylim=c(-8,32))+
  
  geom_segment(data=df_r, aes(x=raw_data_r.lon-75.29883, 
                              y=raw_data_r.lat+18.63885, xend=X2-75.29883, 
                              yend=X1+18.63885), 
               arrow=arrow(length=unit(0.2,"cm")))+
  geom_point(data=df_r, aes(x=X2-75.29883,y=X1+18.63885, 
                            fill=Location), shape=21, cex=2) +
  geom_point(data=df_r_triangles, aes(x=(raw_data_r.lon-75.29883),
                                      y=(raw_data_r.lat+18.63885),fill=Location), shape=24,cex=3.5) +
  ggtitle("Red mangrove Procrustes errors") +
  
  scale_fill_manual(values=c("navy",
                             "#911eb4",
                             "#0082c8",
                             "#e6194b",
                             "#D8BFD8",
                             "#d2f53c",
                             "blue",
                             "darkblue",
                             "black",
                             "palegoldenrod",
                             "#f58231",
                             "#800000",
                             "#B8860B",
                             "#3cb44b",
                             "turquoise",
                             "darkgray",
                             "#e25822",
                             "#136572",
                             "#FFFF99",
                             "#ffe119",
                             "#fabebe",
                             "#ff1694",
                             "#ffd8b1",
                             "maroon",
                             "black",
                             "#00CED1",
                             "#00FF00",
                             "white",
                             "#556b2f",
                             "#4B0082"), 
                    labels=c("Anguilla",
                             "Antigua",
                             "Aruba",
                             "Belize",
                             "Brazil",
                             "Cayman Islands",
                             "Colombia",
                             "Costa Rica",
                             "Costa Rica Pacific",
                             "Cuba",
                             "Everglades City",
                             "Flamingo",
                             "Grand Bahama",
                             "Grenada",
                             "Guyana",
                             "Hispaniola",
                             "Honduras",
                             "Jamaica",
                             "Key West",
                             "Long Island",
                             "Melbourne",
                             "Mexico",
                             "New Port Richey",
                             "Nicaragua",
                             "Panama Pacific",
                             "Puerto Rico",
                             "Saint Martin",
                             "Senegal",
                             "Tobago",
                             "Venezuela"))+
  xlab ("Latitude (degrees)") + ylab("Longitude (degrees)")

ggsave("rhiz_procrustes_map_Pacific.eps", width=10, height=7, dpi = 300)

###################################################################
###################################################################

