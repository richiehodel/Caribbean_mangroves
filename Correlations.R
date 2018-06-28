####################################################################################
### Script by Richie Hodel #########################################################
### richiehodel@gmail.com  #########################################################
####################################################################################

###  This script measures correlations between Procrustes deviations
###  and several other variables 

library('vegan')
library('ggplot2')
install.packages("ggmap")
library('ggmap')
library('maps')
install.packages('mapdata')
library('mapdata')
install.packages("aspace")
install.packages("Matrix")
library("aspace")
library("Matrix")


# Red mangrove

# data acquisition from Mantel_Procrustes script, if necessary
result_r
result_r1
result_r2
plot(result_r1)
plot(result_r2)

df_r <- data.frame(result_r$Yrot)

df_r <- cbind(df_r, lat_lon_r)
df_r <- cbind(df_r, result_r$X)
df_r <- cbind(df_r, raw_data_r$pop)

df_r$pop <- df_r$`raw_data_r$pop`
df_r$`raw_data_r$pop` <- NULL

# get data matrix of points at ends of arrows

xx <- df_r[,1:2]
yy <- df_r[,5:6]


#######################################

dist_r <- data.matrix(sqrt(rowSums((xx-yy)^2)))

# correlate with:

# terrestrial vs. island 1

land_type <- data.matrix(raw_data_r$land_binary)
data_cor_r <- data.frame(dist_r,land_type)

land_anova <- anova(lm (dist_r ~ land_type, 
                        data=data_cor_r))
xyplot(data_cor_r$dist_r ~ data_cor_r$land_type)
lm(data_cor_r$dist_r ~ data_cor_r$land_type)

land_anova

# terrestrial vs. island 2

land_type_2 <- data.matrix(raw_data_r$land_size)
data_cor_r2 <- data.frame(dist_r,land_type_2)

land_anova_2 <- anova(lm (dist_r ~ as.factor(land_type_2), 
                          data=data_cor_r2))

xyplot(data_cor_r2$dist_r ~ data_cor_r2$land_type_2)
lm(data_cor_r2$dist_r ~ data_cor_r2$land_type_2)

land_anova_2

# direction

install.packages('fossil')
library("fossil")

dir_r <- data.frame(xx,yy)
dir_r$zz <- earth.bear(dir_r$X1,dir_r$X2, dir_r$raw_data_r.EV1,
                       dir_r$raw_data_r.EV2)

direction <- data.matrix(dir_r$zz)
dir_cor_r <- data.frame(dist_r,direction)

dir_anova <- anova(lm (dist_r ~ direction, 
                       data=dir_cor_r))
dir_anova
xyplot(dir_cor_r$dist_r ~ dir_cor_r$direction)
lm(dir_cor_r$dist_r ~ dir_cor_r$direction)

# latitude

data_lat_r <- data.frame(dist_r,df_r$raw_data_r.lat)

lat_r_anova <- anova(lm (dist_r ~ df_r.raw_data_r.lat,
                         data=data_lat_r))
xyplot(data_lat_r$dist_r ~ data_lat_r$df_r.raw_data_r.lat)
lm(data_lat_r$dist_r ~ data_lat_r$df_r.raw_data_r.lat)

lat_r_anova
# longitude

data_lon_r <- data.frame(dist_r,df_r$raw_data_r.lon)

lon_r_anova <- anova(lm (dist_r ~ df_r.raw_data_r.lon,
                         data=data_lon_r))
xyplot(data_lon_r$dist_r ~ data_lon_r$df_r.raw_data_r.lon)
lm(data_lon_r$dist_r ~ data_lon_r$df_r.raw_data_r.lon)

lon_r_anova


#######################################
#### white mangrove  ##########################

result
result_l1
result_l2

xxx <- df_l[,1:2]
yyy <- df_l[,5:6]


dist_l <- data.matrix(sqrt(rowSums((xxx-yyy)^2)))

# correlate with:

# terrestrial vs. island 1

land_type_l <- data.matrix(raw_data$land_binary)
data_cor_l <- data.frame(dist_l,land_type_l)

land_anova_l <- anova(lm (dist_l ~ land_type_l, 
                          data=data_cor_l))
xyplot(data_cor_l$dist_l ~ data_cor_l$land_type_l)
land_anova_l

# terrestrial vs. island 2

land_type_l2 <- data.matrix(raw_data$land_size)
data_cor_l2 <- data.frame(dist_l,land_type_l2)

land_anova_l2 <- anova(lm (dist_l ~ as.factor(land_type_l2), 
                           data=data_cor_l2))
land_anova_l2
xyplot(data_cor_r2$dist_r ~ data_cor_r2$land_type_2)

# island size (perimeter)

# working on this Feb 14 2018


df_l_peri <- subset(df_l, df_l$`raw_data$pop`=="Antigua" | 
                      df_l$`raw_data$pop`=="Aruba" |
                      df_l$`raw_data$pop`=="Cayman" |
                      df_l$`raw_data$pop`=="Grenada" |
                      df_l$`raw_data$pop`=="Jamaica" |
                      df_l$`raw_data$pop`=="Long_Island" |
                      df_l$`raw_data$pop`=="Puerto_Rico" )

xxxx <- df_l[,1:2]
yyyy <- df_l[,5:6]


dist_l <- data.matrix(sqrt(rowSums((xxx-yyy)^2)))

# direction

install.packages('fossil')
library("fossil")

dir_l <- data.frame(xxx,yyy)
dir_l$zzz <- earth.bear(dir_l$X1,dir_l$X2, dir_l$raw_data.EV1,
                        dir_l$raw_data.EV2)

direction_l <- data.matrix(dir_l$zzz)
dir_cor_l <- data.frame(dist_l,direction_l)

dir_anova_l <- anova(lm (dist_l ~ direction_l, 
                         data=dir_cor_l))
dir_anova_l
xyplot(dir_cor_l$dist_l ~ dir_cor_l$direction)

# latitude
data_lat_l <- data.frame(dist_l,df_l$raw_data.lat)

lat_l_anova <- anova(lm (dist_l ~ df_l.raw_data.lat,
                         data=data_lat_l))
xyplot(dist_l ~ df_l.raw_data.lat,data=data_lat_l)
lm(dist_l ~ df_l.raw_data.lat,data=data_lat_l)

lat_l_anova
# longitude

data_lon_l <- data.frame(dist_l,df_l$raw_data.lon)

lon_l_anova <- anova(lm (dist_l ~ df_l.raw_data.lon,
                         data=data_lon_l))

lon_l_anova
lm (dist_l ~ df_l.raw_data.lon,
    data=data_lon_l)

xyplot(dist_l ~ df_l.raw_data.lon,
       data=data_lon_l)


#######################################
#######################################

