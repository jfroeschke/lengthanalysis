##
library(readxl)
library(stringr)
library(doBy)

WD <- getwd()
list.files("X:/Data_John/CouncilGit/lengthanalysis")

SPECIES <- c("AtlanticCroaker","BlackDrum","Bonnethead",          
             "GraySnapper","GulfFlounder","Pinfish",         
             "RedDrum", "Sheepshead", "StripedMullet")

for(k in 1:length(SPECIES)){
  #for(k in 1:1){  

newWD <- paste(WD, SPECIES[k], sep="/")
setwd(newWD)
xlist <- list.files(pattern = "*.xlsx")
for(i in 1:length(xlist)){
  #for(i in 1:1){
  x <- data.frame(read_excel(xlist[i], sheet="Sheet1", col_names=TRUE))
  x2 <- summaryBy(length ~ Reference, FUN=c(mean, sd, length), data= x) 
  x2$length.sd[is.na(x2$length.sd)] <- 0
  NAME <-  str_sub(string = xlist[i],  end = -6)
  #assign(NAME, x)
  FILENAME <- paste0("X:/Data_John/CouncilGit/lengthanalysis/out/",NAME, ".csv")
  write.csv(x2, file=FILENAME, row.names=FALSE)
    }##i 
} ## k

            
            