####################################################################################
### Script by Richie Hodel #########################################################
### richiehodel@gmail.com  #########################################################
####################################################################################

###  This script reads in ocean current data

# read in csv files

setwd("/Users/richiehodel/Documents/mangroves/Caribbean_RAD/ocean_current_files/")

####################################################################################
# North files
####################################################################################

####################################################################################
N_Jan2016 <- read.csv("N_Jan2016.csv", skip=10, header=T)
N_Jan2016$LON <- -1*(360-N_Jan2016$LON)
length(N_Jan2016$LAT) # 1072848     # want 1442 columns X 744 rows

m <- 1
starting <- m
ending <- 1442
N_var <- N_Jan2016$V[starting:ending]

for (m in 744:1){
  begin <- m*1442
  starting <- 1072849-begin
  starting
  ending <- starting+1441
  ending
  N_var <- cbind(N_var,N_Jan2016$V[starting:ending])
}

N_var <- data.frame(N_var)
N_var$N_var <- NULL
N_var2 <- t(N_var)
N_var3<-N_var2[dim(N_var2)[1]:1,]

write.table("NCOLS 1442 \nNROWS 744 \nXLLCORNER -100.88 \nYLLCORNER -12.6948 \nCELLSIZE 0.079 \nNODATA_value -1e+34 ",
            file="N_Jan2016csv.asc", row.names = F, 
            col.names = F, quote=F)
write.table(N_var3, file="N_Jan2016csv.asc",append =T, quote=F, row.names = F, col.names = F)

####################################################################################
####################################################################################
####################################################################################
N_Nov2015 <- read.csv("N_Nov2015.csv", skip=10, header=T)
N_Nov2015$LON <- -1*(360-N_Nov2015$LON)
length(N_Nov2015$LAT) # 1072848     # want 1442 columns X 744 rows

m <- 1
starting <- m
ending <- 1442
N_var <- N_Nov2015$V[starting:ending]

for (m in 744:1){
  begin <- m*1442
  starting <- 1072849-begin
  starting
  ending <- starting+1441
  ending
  N_var <- cbind(N_var,N_Nov2015$V[starting:ending])
}

N_var <- data.frame(N_var)
N_var$N_var <- NULL
N_var2 <- t(N_var)
N_var3<-N_var2[dim(N_var2)[1]:1,]

write.table("NCOLS 1442 \nNROWS 744 \nXLLCORNER -100.88 \nYLLCORNER -12.6948 \nCELLSIZE 0.079 \nNODATA_value -1e+34 ",
            file="N_Nov2015csv.asc", row.names = F, 
            col.names = F, quote=F)
write.table(N_var3, file="N_Nov2015csv.asc",append =T, quote=F, row.names = F, col.names = F)

####################################################################################
####################################################################################
N_Sep2015 <- read.csv("N_Sep2015.csv", skip=10, header=T)
N_Sep2015$LON <- -1*(360-N_Sep2015$LON)
length(N_Sep2015$LAT) # 1072848     # want 1442 columns X 744 rows

m <- 1
starting <- m
ending <- 1442
N_var <- N_Sep2015$V[starting:ending]

for (m in 744:1){
  begin <- m*1442
  starting <- 1072849-begin
  starting
  ending <- starting+1441
  ending
  N_var <- cbind(N_var,N_Sep2015$V[starting:ending])
}

N_var <- data.frame(N_var)
N_var$N_var <- NULL
N_var2 <- t(N_var)
N_var3<-N_var2[dim(N_var2)[1]:1,]

write.table("NCOLS 1442 \nNROWS 744 \nXLLCORNER -100.88 \nYLLCORNER -12.6948 \nCELLSIZE 0.079 \nNODATA_value -1e+34 ",
            file="N_Sep2015csv.asc", row.names = F, 
            col.names = F, quote=F)
write.table(N_var3, file="N_Sep2015csv.asc",append =T, quote=F, row.names = F, col.names = F)

####################################################################################
####################################################################################
N_Jul2015 <- read.csv("N_Jul2015.csv", skip=10, header=T)
N_Jul2015$LON <- -1*(360-N_Jul2015$LON)
length(N_Jul2015$LAT) # 1072848     # want 1442 columns X 744 rows

m <- 1
starting <- m
ending <- 1442
N_var <- N_Jul2015$V[starting:ending]

for (m in 744:1){
  begin <- m*1442
  starting <- 1072849-begin
  starting
  ending <- starting+1441
  ending
  N_var <- cbind(N_var,N_Jul2015$V[starting:ending])
}

N_var <- data.frame(N_var)
N_var$N_var <- NULL
N_var2 <- t(N_var)
N_var3<-N_var2[dim(N_var2)[1]:1,]

write.table("NCOLS 1442 \nNROWS 744 \nXLLCORNER -100.88 \nYLLCORNER -12.6948 \nCELLSIZE 0.079 \nNODATA_value -1e+34 ",
            file="N_Jul2015csv.asc", row.names = F, 
            col.names = F, quote=F)
write.table(N_var3, file="N_Jul2015csv.asc",append =T, quote=F, row.names = F, col.names = F)

####################################################################################
####################################################################################
N_May2015 <- read.csv("N_May2015.csv", skip=10, header=T)
N_May2015$LON <- -1*(360-N_May2015$LON)
length(N_May2015$LAT) # 1072848     # want 1442 columns X 744 rows

m <- 1
starting <- m
ending <- 1442
N_var <- N_May2015$V[starting:ending]

for (m in 744:1){
  begin <- m*1442
  starting <- 1072849-begin
  starting
  ending <- starting+1441
  ending
  N_var <- cbind(N_var,N_May2015$V[starting:ending])
}

N_var <- data.frame(N_var)
N_var$N_var <- NULL
N_var2 <- t(N_var)
N_var3<-N_var2[dim(N_var2)[1]:1,]

write.table("NCOLS 1442 \nNROWS 744 \nXLLCORNER -100.88 \nYLLCORNER -12.6948 \nCELLSIZE 0.079 \nNODATA_value -1e+34 ",
            file="N_May2015csv.asc", row.names = F, 
            col.names = F, quote=F)
write.table(N_var3, file="N_May2015csv.asc",append =T, quote=F, row.names = F, col.names = F)

####################################################################################
####################################################################################
N_Mar2015 <- read.csv("N_Mar2015.csv", skip=10, header=T)
N_Mar2015$LON <- -1*(360-N_Mar2015$LON)
length(N_Mar2015$LAT) # 1072848     # want 1442 columns X 744 rows

m <- 1
starting <- m
ending <- 1442
N_var <- N_Mar2015$V[starting:ending]

for (m in 744:1){
  begin <- m*1442
  starting <- 1072849-begin
  starting
  ending <- starting+1441
  ending
  N_var <- cbind(N_var,N_Mar2015$V[starting:ending])
}

N_var <- data.frame(N_var)
N_var$N_var <- NULL
N_var2 <- t(N_var)
N_var3<-N_var2[dim(N_var2)[1]:1,]

write.table("NCOLS 1442 \nNROWS 744 \nXLLCORNER -100.88 \nYLLCORNER -12.6948 \nCELLSIZE 0.079 \nNODATA_value -1e+34 ",
            file="N_Mar2015csv.asc", row.names = F, 
            col.names = F, quote=F)
write.table(N_var3, file="N_Mar2015csv.asc",append =T, quote=F, row.names = F, col.names = F)

####################################################################################
####################################################################################
N_Jan2015 <- read.csv("N_Jan2015.csv", skip=10, header=T)
N_Jan2015$LON <- -1*(360-N_Jan2015$LON)
length(N_Jan2015$LAT) # 1072848     # want 1442 columns X 744 rows

m <- 1
starting <- m
ending <- 1442
N_var <- N_Jan2015$V[starting:ending]

for (m in 744:1){
  begin <- m*1442
  starting <- 1072849-begin
  starting
  ending <- starting+1441
  ending
  N_var <- cbind(N_var,N_Jan2015$V[starting:ending])
}

N_var <- data.frame(N_var)
N_var$N_var <- NULL
N_var2 <- t(N_var)
N_var3<-N_var2[dim(N_var2)[1]:1,]

write.table("NCOLS 1442 \nNROWS 744 \nXLLCORNER -100.88 \nYLLCORNER -12.6948 \nCELLSIZE 0.079 \nNODATA_value -1e+34 ",
            file="N_Jan2015csv.asc", row.names = F, 
            col.names = F, quote=F)
write.table(N_var3, file="N_Jan2015csv.asc",append =T, quote=F, row.names = F, col.names = F)

####################################################################################
####################################################################################
N_Dec2014 <- read.csv("N_Dec2014.csv", skip=10, header=T)
N_Dec2014$LON <- -1*(360-N_Dec2014$LON)
length(N_Dec2014$LAT) # 1072848     # want 1442 columns X 744 rows

m <- 1
starting <- m
ending <- 1442
N_var <- N_Dec2014$V[starting:ending]

for (m in 744:1){
  begin <- m*1442
  starting <- 1072849-begin
  starting
  ending <- starting+1441
  ending
  N_var <- cbind(N_var,N_Dec2014$V[starting:ending])
}

N_var <- data.frame(N_var)
N_var$N_var <- NULL
N_var2 <- t(N_var)
N_var3<-N_var2[dim(N_var2)[1]:1,]

write.table("NCOLS 1442 \nNROWS 744 \nXLLCORNER -100.88 \nYLLCORNER -12.6948 \nCELLSIZE 0.079 \nNODATA_value -1e+34 ",
            file="N_Dec2014csv.asc", row.names = F, 
            col.names = F, quote=F)
write.table(N_var3, file="N_Dec2014csv.asc",append =T, quote=F, row.names = F, col.names = F)

####################################################################################
####################################################################################
N_Oct2014 <- read.csv("N_Oct2014.csv", skip=10, header=T)
N_Oct2014$LON <- -1*(360-N_Oct2014$LON)
length(N_Oct2014$LAT) # 1072848     # want 1442 columns X 744 rows

m <- 1
starting <- m
ending <- 1442
N_var <- N_Oct2014$V[starting:ending]

for (m in 744:1){
  begin <- m*1442
  starting <- 1072849-begin
  starting
  ending <- starting+1441
  ending
  N_var <- cbind(N_var,N_Oct2014$V[starting:ending])
}

N_var <- data.frame(N_var)
N_var$N_var <- NULL
N_var2 <- t(N_var)
N_var3<-N_var2[dim(N_var2)[1]:1,]

write.table("NCOLS 1442 \nNROWS 744 \nXLLCORNER -100.88 \nYLLCORNER -12.6948 \nCELLSIZE 0.079 \nNODATA_value -1e+34 ",
            file="N_Oct2014csv.asc", row.names = F, 
            col.names = F, quote=F)
write.table(N_var3, file="N_Oct2014csv.asc",append =T, quote=F, row.names = F, col.names = F)

####################################################################################
####################################################################################
N_Aug2014 <- read.csv("N_Aug2014.csv", skip=10, header=T)
N_Aug2014$LON <- -1*(360-N_Aug2014$LON)
length(N_Aug2014$LAT) # 1072848     # want 1442 columns X 744 rows

m <- 1
starting <- m
ending <- 1442
N_var <- N_Aug2014$V[starting:ending]

for (m in 744:1){
  begin <- m*1442
  starting <- 1072849-begin
  starting
  ending <- starting+1441
  ending
  N_var <- cbind(E_var,N_Aug2014$V[starting:ending])
}

N_var <- data.frame(N_var)
N_var$N_var <- NULL
N_var2 <- t(N_var)
N_var3<-N_var2[dim(N_var2)[1]:1,]

write.table("NCOLS 1442 \nNROWS 744 \nXLLCORNER -100.88 \nYLLCORNER -12.6948 \nCELLSIZE 0.079 \nNODATA_value -1e+34 ",
            file="N_Aug2014csv.asc", row.names = F, 
            col.names = F, quote=F)
write.table(N_var3, file="N_Aug2014csv.asc",append =T, quote=F, row.names = F, col.names = F)

####################################################################################
####################################################################################
N_Jun2014 <- read.csv("N_Jun2014.csv", skip=10, header=T)
N_Jun2014$LON <- -1*(360-N_Jun2014$LON)
length(N_Jun2014$LAT) # 1072848     # want 1442 columns X 744 rows

m <- 1
starting <- m
ending <- 1442
N_var <- N_Jun2014$V[starting:ending]

for (m in 744:1){
  begin <- m*1442
  starting <- 1072849-begin
  starting
  ending <- starting+1441
  ending
  N_var <- cbind(N_var,N_Jun2014$V[starting:ending])
}

N_var <- data.frame(N_var)
N_var$N_var <- NULL
N_var2 <- t(N_var)
N_var3<-N_var2[dim(N_var2)[1]:1,]

write.table("NCOLS 1442 \nNROWS 744 \nXLLCORNER -100.88 \nYLLCORNER -12.6948 \nCELLSIZE 0.079 \nNODATA_value -1e+34 ",
            file="N_Jun2014csv.asc", row.names = F, 
            col.names = F, quote=F)
write.table(N_var3, file="N_Jun2014csv.asc",append =T, quote=F, row.names = F, col.names = F)

####################################################################################
####################################################################################
N_Apr2014 <- read.csv("N_Apr2014.csv", skip=10, header=T)
N_Apr2014$LON <- -1*(360-N_Apr2014$LON)
length(N_Apr2014$LAT) # 1072848     # want 1442 columns X 744 rows

m <- 1
starting <- m
ending <- 1442
N_var <- N_Apr2014$V[starting:ending]

for (m in 744:1){
  begin <- m*1442
  starting <- 1072849-begin
  starting
  ending <- starting+1441
  ending
  N_var <- cbind(N_var,N_Apr2014$V[starting:ending])
}

N_var <- data.frame(N_var)
N_var$N_var <- NULL
N_var2 <- t(N_var)
N_var3<-N_var2[dim(N_var2)[1]:1,]

write.table("NCOLS 1442 \nNROWS 744 \nXLLCORNER -100.88 \nYLLCORNER -12.6948 \nCELLSIZE 0.079 \nNODATA_value -1e+34 ",
            file="N_Apr2014csv.asc", row.names = F, 
            col.names = F, quote=F)
write.table(N_var3, file="N_Apr2014csv.asc",append =T, quote=F, row.names = F, col.names = F)

####################################################################################
####################################################################################
N_Feb2014 <- read.csv("N_Feb2014.csv", skip=10, header=T)
N_Feb2014$LON <- -1*(360-N_Feb2014$LON)
length(N_Feb2014$LAT) # 1072848     # want 1442 columns X 744 rows

m <- 1
starting <- m
ending <- 1442
N_var <- N_Feb2014$V[starting:ending]

for (m in 744:1){
  begin <- m*1442
  starting <- 1072849-begin
  starting
  ending <- starting+1441
  ending
  N_var <- cbind(N_var,N_Feb2014$V[starting:ending])
}

N_var <- data.frame(N_var)
N_var$N_var <- NULL
N_var2 <- t(N_var)
N_var3<-N_var2[dim(N_var2)[1]:1,]

write.table("NCOLS 1442 \nNROWS 744 \nXLLCORNER -100.88 \nYLLCORNER -12.6948 \nCELLSIZE 0.079 \nNODATA_value -1e+34 ",
            file="N_Feb2014csv.asc", row.names = F, 
            col.names = F, quote=F)
write.table(N_var3, file="N_Feb2014csv.asc",append =T, quote=F, row.names = F, col.names = F)

####################################################################################

### East files  ###

E_Jan2016 <- read.csv("E_Jan2016.csv", skip=10, header=T)
E_Jan2016$LON <- -1*(360-E_Jan2016$LON)

length(E_Jan2016$LAT) # 1072848
# want 1442 columns X 744 rows

m <- 1
starting <- m
ending <- 1442
E_var <- E_Jan2016$U[starting:ending]

for (m in 744:1){
  
  begin <- m*1442
  starting <- 1072849-begin
  starting
  ending <- starting+1441
  ending
  E_var <- cbind(E_var,E_Jan2016$U[starting:ending])
  
}
E_var <- data.frame(E_var)
E_var$E_var <- NULL
E_var2 <- t(E_var)
E_var3<-E_var2[dim(E_var2)[1]:1,]

write.table("NCOLS 1442 \nNROWS 744 \nXLLCORNER -100.88 \nYLLCORNER -12.6948 \nCELLSIZE 0.079 \nNODATA_value -1e+34 ",
            file="E_Jan2016csv.asc", row.names = F, 
            col.names = F, quote=F)
write.table(E_var3, file="E_Jan2016csv.asc",append =T, quote=F, row.names = F, col.names = F)

####################################################################################
E_Nov2015 <- read.csv("E_Nov2015.csv", skip=10, header=T)
E_Nov2015$LON <- -1*(360-E_Nov2015$LON)
length(E_Nov2015$LAT) # 1072848     # want 1442 columns X 744 rows

m <- 1
starting <- m
ending <- 1442
E_var <- E_Nov2015$U[starting:ending]

for (m in 744:1){
  begin <- m*1442
  starting <- 1072849-begin
  starting
  ending <- starting+1441
  ending
  E_var <- cbind(E_var,E_Nov2015$U[starting:ending])
}

E_var <- data.frame(E_var)
E_var$E_var <- NULL
E_var2 <- t(E_var)
E_var3<-E_var2[dim(E_var2)[1]:1,]

write.table("NCOLS 1442 \nNROWS 744 \nXLLCORNER -100.88 \nYLLCORNER -12.6948 \nCELLSIZE 0.079 \nNODATA_value -1e+34 ",
            file="E_Nov2015csv.asc", row.names = F, 
            col.names = F, quote=F)
write.table(E_var3, file="E_Nov2015csv.asc",append =T, quote=F, row.names = F, col.names = F)

####################################################################################
####################################################################################
E_Sep2015 <- read.csv("E_Sep2015.csv", skip=10, header=T)
E_Sep2015$LON <- -1*(360-E_Sep2015$LON)
length(E_Sep2015$LAT) # 1072848     # want 1442 columns X 744 rows

m <- 1
starting <- m
ending <- 1442
E_var <- E_Sep2015$U[starting:ending]

for (m in 744:1){
  begin <- m*1442
  starting <- 1072849-begin
  starting
  ending <- starting+1441
  ending
  E_var <- cbind(E_var,E_Sep2015$U[starting:ending])
}

E_var <- data.frame(E_var)
E_var$E_var <- NULL
E_var2 <- t(E_var)
E_var3<-E_var2[dim(E_var2)[1]:1,]

write.table("NCOLS 1442 \nNROWS 744 \nXLLCORNER -100.88 \nYLLCORNER -12.6948 \nCELLSIZE 0.079 \nNODATA_value -1e+34 ",
            file="E_Sep2015csv.asc", row.names = F, 
            col.names = F, quote=F)
write.table(E_var3, file="E_Sep2015csv.asc",append =T, quote=F, row.names = F, col.names = F)

####################################################################################
####################################################################################
E_Jul2015 <- read.csv("E_Jul2015.csv", skip=10, header=T)
E_Jul2015$LON <- -1*(360-E_Jul2015$LON)
length(E_Jul2015$LAT) # 1072848     # want 1442 columns X 744 rows

m <- 1
starting <- m
ending <- 1442
E_var <- E_Jul2015$U[starting:ending]

for (m in 744:1){
  begin <- m*1442
  starting <- 1072849-begin
  starting
  ending <- starting+1441
  ending
  E_var <- cbind(E_var,E_Jul2015$U[starting:ending])
}

E_var <- data.frame(E_var)
E_var$E_var <- NULL
E_var2 <- t(E_var)
E_var3<-E_var2[dim(E_var2)[1]:1,]

write.table("NCOLS 1442 \nNROWS 744 \nXLLCORNER -100.88 \nYLLCORNER -12.6948 \nCELLSIZE 0.079 \nNODATA_value -1e+34 ",
            file="E_Jul2015csv.asc", row.names = F, 
            col.names = F, quote=F)
write.table(E_var3, file="E_Jul2015csv.asc",append =T, quote=F, row.names = F, col.names = F)

####################################################################################
####################################################################################
E_May2015 <- read.csv("E_May2015.csv", skip=10, header=T)
E_May2015$LON <- -1*(360-E_May2015$LON)
length(E_May2015$LAT) # 1072848     # want 1442 columns X 744 rows

m <- 1
starting <- m
ending <- 1442
E_var <- E_May2015$U[starting:ending]

for (m in 744:1){
  begin <- m*1442
  starting <- 1072849-begin
  starting
  ending <- starting+1441
  ending
  E_var <- cbind(E_var,E_May2015$U[starting:ending])
}

E_var <- data.frame(E_var)
E_var$E_var <- NULL
E_var2 <- t(E_var)
E_var3<-E_var2[dim(E_var2)[1]:1,]

write.table("NCOLS 1442 \nNROWS 744 \nXLLCORNER -100.88 \nYLLCORNER -12.6948 \nCELLSIZE 0.079 \nNODATA_value -1e+34 ",
            file="E_May2015csv.asc", row.names = F, 
            col.names = F, quote=F)
write.table(E_var3, file="E_May2015csv.asc",append =T, quote=F, row.names = F, col.names = F)

####################################################################################
####################################################################################
E_Mar2015 <- read.csv("E_Mar2015.csv", skip=10, header=T)
E_Mar2015$LON <- -1*(360-E_Mar2015$LON)
length(E_Mar2015$LAT) # 1072848     # want 1442 columns X 744 rows

m <- 1
starting <- m
ending <- 1442
E_var <- E_Mar2015$U[starting:ending]

for (m in 744:1){
  begin <- m*1442
  starting <- 1072849-begin
  starting
  ending <- starting+1441
  ending
  E_var <- cbind(E_var,E_Mar2015$U[starting:ending])
}

E_var <- data.frame(E_var)
E_var$E_var <- NULL
E_var2 <- t(E_var)
E_var3<-E_var2[dim(E_var2)[1]:1,]

write.table("NCOLS 1442 \nNROWS 744 \nXLLCORNER -100.88 \nYLLCORNER -12.6948 \nCELLSIZE 0.079 \nNODATA_value -1e+34 ",
            file="E_Mar2015csv.asc", row.names = F, 
            col.names = F, quote=F)
write.table(E_var3, file="E_Mar2015csv.asc",append =T, quote=F, row.names = F, col.names = F)

####################################################################################
####################################################################################
E_Jan2015 <- read.csv("E_Jan2015.csv", skip=10, header=T)
E_Jan2015$LON <- -1*(360-E_Jan2015$LON)
length(E_Jan2015$LAT) # 1072848     # want 1442 columns X 744 rows

m <- 1
starting <- m
ending <- 1442
E_var <- E_Jan2015$U[starting:ending]

for (m in 744:1){
  begin <- m*1442
  starting <- 1072849-begin
  starting
  ending <- starting+1441
  ending
  E_var <- cbind(E_var,E_Jan2015$U[starting:ending])
}

E_var <- data.frame(E_var)
E_var$E_var <- NULL
E_var2 <- t(E_var)
E_var3<-E_var2[dim(E_var2)[1]:1,]

write.table("NCOLS 1442 \nNROWS 744 \nXLLCORNER -100.88 \nYLLCORNER -12.6948 \nCELLSIZE 0.079 \nNODATA_value -1e+34 ",
            file="E_Jan2015csv.asc", row.names = F, 
            col.names = F, quote=F)
write.table(E_var3, file="E_Jan2015csv.asc",append =T, quote=F, row.names = F, col.names = F)

####################################################################################
####################################################################################
E_Dec2014 <- read.csv("E_Dec2014.csv", skip=10, header=T)
E_Dec2014$LON <- -1*(360-E_Dec2014$LON)
length(E_Dec2014$LAT) # 1072848     # want 1442 columns X 744 rows

m <- 1
starting <- m
ending <- 1442
E_var <- E_Dec2014$U[starting:ending]

for (m in 744:1){
  begin <- m*1442
  starting <- 1072849-begin
  starting
  ending <- starting+1441
  ending
  E_var <- cbind(E_var,E_Dec2014$U[starting:ending])
}

E_var <- data.frame(E_var)
E_var$E_var <- NULL
E_var2 <- t(E_var)
E_var3<-E_var2[dim(E_var2)[1]:1,]

write.table("NCOLS 1442 \nNROWS 744 \nXLLCORNER -100.88 \nYLLCORNER -12.6948 \nCELLSIZE 0.079 \nNODATA_value -1e+34 ",
            file="E_Dec2014csv.asc", row.names = F, 
            col.names = F, quote=F)
write.table(E_var3, file="E_Dec2014csv.asc",append =T, quote=F, row.names = F, col.names = F)

####################################################################################
####################################################################################
E_Oct2014 <- read.csv("E_Oct2014.csv", skip=10, header=T)
E_Oct2014$LON <- -1*(360-E_Oct2014$LON)
length(E_Oct2014$LAT) # 1072848     # want 1442 columns X 744 rows

m <- 1
starting <- m
ending <- 1442
E_var <- E_Oct2014$U[starting:ending]

for (m in 744:1){
  begin <- m*1442
  starting <- 1072849-begin
  starting
  ending <- starting+1441
  ending
  E_var <- cbind(E_var,E_Oct2014$U[starting:ending])
}

E_var <- data.frame(E_var)
E_var$E_var <- NULL
E_var2 <- t(E_var)
E_var3<-E_var2[dim(E_var2)[1]:1,]

write.table("NCOLS 1442 \nNROWS 744 \nXLLCORNER -100.88 \nYLLCORNER -12.6948 \nCELLSIZE 0.079 \nNODATA_value -1e+34 ",
            file="E_Oct2014csv.asc", row.names = F, 
            col.names = F, quote=F)
write.table(E_var3, file="E_Oct2014csv.asc",append =T, quote=F, row.names = F, col.names = F)

####################################################################################
####################################################################################
E_Aug2014 <- read.csv("E_Aug2014.csv", skip=10, header=T)
E_Aug2014$LON <- -1*(360-E_Aug2014$LON)
length(E_Aug2014$LAT) # 1072848     # want 1442 columns X 744 rows

m <- 1
starting <- m
ending <- 1442
E_var <- E_Aug2014$U[starting:ending]

for (m in 744:1){
  begin <- m*1442
  starting <- 1072849-begin
  starting
  ending <- starting+1441
  ending
  E_var <- cbind(E_var,E_Aug2014$U[starting:ending])
}

E_var <- data.frame(E_var)
E_var$E_var <- NULL
E_var2 <- t(E_var)
E_var3<-E_var2[dim(E_var2)[1]:1,]

write.table("NCOLS 1442 \nNROWS 744 \nXLLCORNER -100.88 \nYLLCORNER -12.6948 \nCELLSIZE 0.079 \nNODATA_value -1e+34 ",
            file="E_Aug2014csv.asc", row.names = F, 
            col.names = F, quote=F)
write.table(E_var3, file="E_Aug2014csv.asc",append =T, quote=F, row.names = F, col.names = F)

####################################################################################
####################################################################################
E_Jun2014 <- read.csv("E_Jun2014.csv", skip=10, header=T)
E_Jun2014$LON <- -1*(360-E_Jun2014$LON)
length(E_Jun2014$LAT) # 1072848     # want 1442 columns X 744 rows

m <- 1
starting <- m
ending <- 1442
E_var <- E_Jun2014$U[starting:ending]

for (m in 744:1){
  begin <- m*1442
  starting <- 1072849-begin
  starting
  ending <- starting+1441
  ending
  E_var <- cbind(E_var,E_Jun2014$U[starting:ending])
}

E_var <- data.frame(E_var)
E_var$E_var <- NULL
E_var2 <- t(E_var)
E_var3<-E_var2[dim(E_var2)[1]:1,]

write.table("NCOLS 1442 \nNROWS 744 \nXLLCORNER -100.88 \nYLLCORNER -12.6948 \nCELLSIZE 0.079 \nNODATA_value -1e+34 ",
            file="E_Jun2014csv.asc", row.names = F, 
            col.names = F, quote=F)
write.table(E_var3, file="E_Jun2014csv.asc",append =T, quote=F, row.names = F, col.names = F)

####################################################################################
####################################################################################
E_Apr2014 <- read.csv("E_Apr2014.csv", skip=10, header=T)
E_Apr2014$LON <- -1*(360-E_Apr2014$LON)
length(E_Apr2014$LAT) # 1072848     # want 1442 columns X 744 rows

m <- 1
starting <- m
ending <- 1442
E_var <- E_Apr2014$U[starting:ending]

for (m in 744:1){
  begin <- m*1442
  starting <- 1072849-begin
  starting
  ending <- starting+1441
  ending
  E_var <- cbind(E_var,E_Apr2014$U[starting:ending])
}

E_var <- data.frame(E_var)
E_var$E_var <- NULL
E_var2 <- t(E_var)
E_var3<-E_var2[dim(E_var2)[1]:1,]

write.table("NCOLS 1442 \nNROWS 744 \nXLLCORNER -100.88 \nYLLCORNER -12.6948 \nCELLSIZE 0.079 \nNODATA_value -1e+34 ",
            file="E_Apr2014csv.asc", row.names = F, 
            col.names = F, quote=F)
write.table(E_var3, file="E_Apr2014csv.asc",append =T, quote=F, row.names = F, col.names = F)

####################################################################################
####################################################################################
E_Feb2014 <- read.csv("E_Feb2014.csv", skip=10, header=T)
E_Feb2014$LON <- -1*(360-E_Feb2014$LON)
length(E_Feb2014$LAT) # 1072848     # want 1442 columns X 744 rows

m <- 1
starting <- m
ending <- 1442
E_var <- E_Feb2014$U[starting:ending]

for (m in 744:1){
  begin <- m*1442
  starting <- 1072849-begin
  starting
  ending <- starting+1441
  ending
  E_var <- cbind(E_var,E_Feb2014$U[starting:ending])
}

E_var <- data.frame(E_var)
E_var$E_var <- NULL
E_var2 <- t(E_var)
E_var3<-E_var2[dim(E_var2)[1]:1,]

write.table("NCOLS 1442 \nNROWS 744 \nXLLCORNER -100.88 \nYLLCORNER -12.6948 \nCELLSIZE 0.079 \nNODATA_value -1e+34 ",
            file="E_Feb2014csv.asc", row.names = F, 
            col.names = F, quote=F)
write.table(E_var3, file="E_Feb2014csv.asc",append =T, quote=F, row.names = F, col.names = F)

####################################################################################
####################################################################################
####################################################################################
# now get E average and N average
####################################################################################
####################################################################################

E_Avg <- (E_Jan2016$U+E_Nov2015$U+E_Sep2015$U+E_Jul2015$U+E_May2015$U+
            E_Mar2015$U+E_Jan2015$U+E_Dec2014$U+E_Oct2014$U+E_Aug2014$U+
            E_Jun2014$U+E_Apr2014$U+E_Feb2014$U)/13

m <- 1
starting <- m
ending <- 1442
E_var <- E_Avg[starting:ending]

for (m in 744:1){
  begin <- m*1442
  starting <- 1072849-begin
  starting
  ending <- starting+1441
  ending
  E_var <- cbind(E_var,E_Avg[starting:ending])
}

E_var <- data.frame(E_var)
E_var$E_var <- NULL
E_var2 <- t(E_var)
E_var3<-E_var2[dim(E_var2)[1]:1,]


N_Avg <- (N_Jan2016$V+N_Nov2015$V+N_Sep2015$V+N_Jul2015$V+N_May2015$V+
            N_Mar2015$V+N_Jan2015$V+N_Dec2014$V+N_Oct2014$V+N_Aug2014$V+
            N_Jun2014$V+N_Apr2014$V+N_Feb2014$V)/13

m <- 1
starting <- m
ending <- 1442
N_var <- N_Avg[starting:ending]

for (m in 744:1){
  begin <- m*1442
  starting <- 1072849-begin
  starting
  ending <- starting+1441
  ending
  N_var <- cbind(N_var,N_Avg[starting:ending])
}

N_var <- data.frame(N_var)
N_var$N_var <- NULL
N_var2 <- t(N_var)
N_var3<-N_var2[dim(N_var2)[1]:1,]

E_var3 <- data.frame(E_var3)
N_var3 <- data.frame(N_var3)
bunchofzeros <- E_var3*0
div <- bunchofzeros

bearings_999 <- read.table(file="avg_bearings_nodata.txt", stringsAsFactors = F)

write.table("NCOLS 1442 \nNROWS 744 \nXLLCORNER -100.88 \nYLLCORNER -12.6948 \nCELLSIZE 0.079 \nNODATA_value -1e+34 ",
            file="avg_bearings.asc", row.names = F, 
            col.names = F, quote=F)
write.table(bearings_999, file="avg_bearings.asc",append =T, quote=F, row.names = F, col.names = F)



#######
# this code (next 20 lines)  loops to get all
# pairwise comparisons -- but also want to look at each bearing in 
# each pixel, not just avearge bearing
#######

library('raster')
bearings <- raster("avg_bearings.asc")



first_lat <- GPS$lat[15]
first_lon <- GPS$lon[15]
second_lat <- GPS$lat[12]
second_lon <- GPS$lon[12]
cds1 <- rbind(c(first_lon,first_lat), c(second_lon,second_lat))
transect <- SpatialLines(list(Lines(list(Line(cds1)),ID="one")))

e <- extract(bearings,transect)
edata <- data.frame(e)
edata <- na.omit(edata)
colnames(edata) <- c("bear")

mean(edata$bear)
######################################################################

# considering all bearings, not just average


first_lat <- GPS$lat[15]
first_lon <- GPS$lon[15]
second_lat <- GPS$lat[12]
second_lon <- GPS$lon[12]
cds1 <- rbind(c(first_lon,first_lat), c(second_lon,second_lat))
transect <- SpatialLines(list(Lines(list(Line(cds1)),ID="one")))

e <- extract(bearings,transect)
edata <- data.frame(e)
edata <- na.omit(edata)
colnames(edata) <- c("bear")
edata
mean(edata$bear)
nrow(edata)
actual1 <- earth.bear(first_lon, first_lat, second_lon, second_lat)
actual2 <- earth.bear(second_lon, second_lat, first_lon, first_lat)
diff1 <- edata-actual1
diff2 <- edata-actual2

sum(abs(diff1$bear))
mean(abs(diff1$bear))
sum(abs(diff2$bear))
mean(abs(diff2$bear))
######################################################################
actual1 #100.3294    E-SE
actual2 #282.7534    W-NW

GPS$ID[15]

GPS$ID[12]

