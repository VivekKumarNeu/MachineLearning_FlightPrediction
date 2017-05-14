###################################
setwd("C:\\Northeastern\\Semester4\\ADS\\Final Project\\Datasets\\2006.csv")
consolidate <- read.csv("2006.csv", header=TRUE)
df1<-consolidate[consolidate$Origin=='JFK',]
temp2<-mapply(function(x,y) paste0(rep(x,y),collapse=""),0,4-nchar(df1$CRSDepTime))
df1$CRSDepTime<-paste0(temp2,df1$CRSDepTime)
df1$Hour<-format(strptime(df1$CRSDepTime,format="%H%M"),format="%H")
write.csv(df1[,], file = "JFK.csv",row.names=FALSE)
###################################
setwd("C:\\Northeastern\\Semester4\\ADS\\Final Project\\Datasets\\2004.csv")
consolidate <- read.csv("2004.csv", header=TRUE)
df1<-consolidate[consolidate$Origin=='JFK',]
temp2<-mapply(function(x,y) paste0(rep(x,y),collapse=""),0,4-nchar(df1$CRSDepTime))
df1$CRSDepTime<-paste0(temp2,df1$CRSDepTime)
df1$Hour<-format(strptime(df1$CRSDepTime,format="%H%M"),format="%H")
write.csv(df1[,], file = "JFK.csv",row.names=FALSE)
###################################
setwd("C:\\Northeastern\\Semester4\\ADS\\Final Project\\Datasets\\2005.csv")
consolidate <- read.csv("2005.csv", header=TRUE)
df1<-consolidate[consolidate$Origin=='JFK',]
temp2<-mapply(function(x,y) paste0(rep(x,y),collapse=""),0,4-nchar(df1$CRSDepTime))
df1$CRSDepTime<-paste0(temp2,df1$CRSDepTime)
df1$Hour<-format(strptime(df1$CRSDepTime,format="%H%M"),format="%H")
write.csv(df1[,], file = "JFK.csv",row.names=FALSE)
###################################
setwd("C:\\Northeastern\\Semester4\\ADS\\Final Project\\Datasets\\2007.csv")
consolidate <- read.csv("2007.csv", header=TRUE)
df1<-consolidate[consolidate$Origin=='JFK',]
temp2<-mapply(function(x,y) paste0(rep(x,y),collapse=""),0,4-nchar(df1$CRSDepTime))
df1$CRSDepTime<-paste0(temp2,df1$CRSDepTime)
df1$Hour<-format(strptime(df1$CRSDepTime,format="%H%M"),format="%H")
write.csv(df1[,], file = "JFK.csv",row.names=FALSE)
#####################################
setwd("C:\\Northeastern\\Semester4\\ADS\\Final Project\\Datasets\\2003.csv")
consolidate <- read.csv("2003.csv", header=TRUE)
df1<-consolidate[consolidate$Origin=='JFK',]
temp2<-mapply(function(x,y) paste0(rep(x,y),collapse=""),0,4-nchar(df1$CRSDepTime))
df1$CRSDepTime<-paste0(temp2,df1$CRSDepTime)
df1$Hour<-format(strptime(df1$CRSDepTime,format="%H%M"),format="%H")
write.csv(df1[,], file = "JFK.csv",row.names=FALSE)
#####################################
setwd("C:\\Northeastern\\Semester4\\ADS\\Final Project\\Datasets\\2006.csv")
consolidate <- read.csv("JFK.csv", header=TRUE)
consolidate$Quarter[consolidate$Month %in% c("1","2","3")]<-1
consolidate$Quarter[consolidate$Month %in% c("4","5","6")]<-2
consolidate$Quarter[consolidate$Month %in% c("7","8","9")]<-3
consolidate$Quarter[consolidate$Month %in% c("10","11","12")]<-4
View(consolidate)
unique(consolidate$Origin)
write.csv(consolidate[,], file = "JFK.csv",row.names=FALSE)
#######################################
setwd("C:\\Northeastern\\Semester4\\ADS\\Final Project\\Datasets\\2003.csv")
consolidate <- read.csv("JFK.csv", header=TRUE)
consolidate$Quarter[consolidate$Month %in% c("1","2","3")]<-1
consolidate$Quarter[consolidate$Month %in% c("4","5","6")]<-2
consolidate$Quarter[consolidate$Month %in% c("7","8","9")]<-3
consolidate$Quarter[consolidate$Month %in% c("10","11","12")]<-4
View(consolidate)
unique(consolidate$Quarter)
write.csv(consolidate[,], file = "JFK.csv",row.names=FALSE)
#######################################################################
setwd("C:\\Northeastern\\Semester4\\ADS\\Final Project\\Datasets\\2004.csv")
consolidate <- read.csv("JFK.csv", header=TRUE)
consolidate$Quarter[consolidate$Month %in% c("1","2","3")]<-1
consolidate$Quarter[consolidate$Month %in% c("4","5","6")]<-2
consolidate$Quarter[consolidate$Month %in% c("7","8","9")]<-3
consolidate$Quarter[consolidate$Month %in% c("10","11","12")]<-4
write.csv(consolidate[,], file = "JFK.csv",row.names=FALSE)
#######################################################################
setwd("C:\\Northeastern\\Semester4\\ADS\\Final Project\\Datasets\\2005.csv")
consolidate <- read.csv("JFK.csv", header=TRUE)
consolidate$Quarter[consolidate$Month %in% c("1","2","3")]<-1
consolidate$Quarter[consolidate$Month %in% c("4","5","6")]<-2
consolidate$Quarter[consolidate$Month %in% c("7","8","9")]<-3
consolidate$Quarter[consolidate$Month %in% c("10","11","12")]<-4
write.csv(consolidate[,], file = "JFK.csv",row.names=FALSE)
######################################
setwd("C:\\Northeastern\\Semester4\\ADS\\Final Project\\Datasets\\2007.csv")
consolidate <- read.csv("JFK.csv", header=TRUE)
consolidate$Quarter[consolidate$Month %in% c("1","2","3")]<-1
consolidate$Quarter[consolidate$Month %in% c("4","5","6")]<-2
consolidate$Quarter[consolidate$Month %in% c("7","8","9")]<-3
consolidate$Quarter[consolidate$Month %in% c("10","11","12")]<-4
write.csv(consolidate[,], file = "JFK.csv",row.names=FALSE)
######################################

df1<-read.csv("C:\\Northeastern\\Semester4\\ADS\\Final Project\\Python2.7\\2003scrappeddata.csv", header=TRUE)
df2<-read.csv("C:\\Northeastern\\Semester4\\ADS\\Final Project\\Python2.7\\2004scrappeddata.csv", header=TRUE)
df3<-read.csv("C:\\Northeastern\\Semester4\\ADS\\Final Project\\Python2.7\\2005data.csv", header=TRUE)
df4<-read.csv("C:\\Northeastern\\Semester4\\ADS\\Final Project\\Python2.7\\2006data.csv", header=TRUE)
df5<-read.csv("C:\\Northeastern\\Semester4\\ADS\\Final Project\\Python2.7\\2007data.csv", header=TRUE)
setwd("C:\\Northeastern\\Semester4\\ADS\\Final Project\\Python2.7")

DF<-rbind(df1,df2,df3,df4,df5)
write.csv(DF[,], file = "MergedWeather.csv",row.names=FALSE)


df1<-read.csv("C:\\Northeastern\\Semester4\\ADS\\Final Project\\Datasets\\2003.csv\\JFK.csv", header=TRUE)
df2<-read.csv("C:\\Northeastern\\Semester4\\ADS\\Final Project\\Datasets\\2004.csv\\2004JFK.csv", header=TRUE)
df3<-read.csv("C:\\Northeastern\\Semester4\\ADS\\Final Project\\Datasets\\2005.csv\\2005JFK.csv", header=TRUE)
df4<-read.csv("C:\\Northeastern\\Semester4\\ADS\\Final Project\\Datasets\\2006.csv\\2006JFK.csv", header=TRUE)
df5<-read.csv("C:\\Northeastern\\Semester4\\ADS\\Final Project\\Datasets\\2007.csv\\JFK.csv", header=TRUE)
setwd("C:\\Northeastern\\Semester4\\ADS\\Final Project\\Python2.7")
DF<-rbind(df1,df2,df3,df4,df5)
write.csv(DF[,], file = "MergedJFK.csv",row.names=FALSE)

df1<-read.csv("C:\\Northeastern\\Semester4\\ADS\\Final Project\\Python2.7\\MergedWeather.csv", header=TRUE)
df1$Quarter[df1$Month %in% c("1","2","3")]<-1
df1$Quarter[df1$Month %in% c("4","5","6")]<-2
df1$Quarter[df1$Month %in% c("7","8","9")]<-3
df1$Quarter[df1$Month %in% c("10","11","12")]<-4
write.csv(df1[,], file = "MergedWeather.csv",row.names=FALSE)

setwd("C:\\Northeastern\\Semester4\\ADS\\Final Project\\Python2.7\\AverageFare_Q2_2006")
df1<-read.csv("C:\\Northeastern\\Semester4\\ADS\\Final Project\\Python2.7\\AverageFare_Q2_2006\\AverageFare_Q1_2003.xls.csv", header=TRUE)
df2<-read.csv("C:\\Northeastern\\Semester4\\ADS\\Final Project\\Python2.7\\AverageFare_Q2_2006\\AverageFare_Q1_2004.xls.csv", header=TRUE)
df3<-read.csv("C:\\Northeastern\\Semester4\\ADS\\Final Project\\Python2.7\\AverageFare_Q2_2006\\AverageFare_Q1_2005.xls.csv", header=TRUE)
df4<-read.csv("C:\\Northeastern\\Semester4\\ADS\\Final Project\\Python2.7\\AverageFare_Q2_2006\\AverageFare_Q1_2006.xls.csv", header=TRUE)
df5<-read.csv("C:\\Northeastern\\Semester4\\ADS\\Final Project\\Python2.7\\AverageFare_Q2_2006\\AverageFare_Q1_2007.xls.csv", header=TRUE)
df6<-read.csv("C:\\Northeastern\\Semester4\\ADS\\Final Project\\Python2.7\\AverageFare_Q2_2006\\AverageFare_Q2_2003.xls.csv", header=TRUE)
df7<-read.csv("C:\\Northeastern\\Semester4\\ADS\\Final Project\\Python2.7\\AverageFare_Q2_2006\\AverageFare_Q2_2004.xls.csv", header=TRUE)
df8<-read.csv("C:\\Northeastern\\Semester4\\ADS\\Final Project\\Python2.7\\AverageFare_Q2_2006\\AverageFare_Q2_2005.xls.csv", header=TRUE)
df9<-read.csv("C:\\Northeastern\\Semester4\\ADS\\Final Project\\Python2.7\\AverageFare_Q2_2006\\AverageFare_Q2_2006.xls.csv", header=TRUE)
df10<-read.csv("C:\\Northeastern\\Semester4\\ADS\\Final Project\\Python2.7\\AverageFare_Q2_2006\\AverageFare_Q2_2007.xls.csv", header=TRUE)
df11<-read.csv("C:\\Northeastern\\Semester4\\ADS\\Final Project\\Python2.7\\AverageFare_Q2_2006\\AverageFare_Q3_2003.xls.csv", header=TRUE)
df12<-read.csv("C:\\Northeastern\\Semester4\\ADS\\Final Project\\Python2.7\\AverageFare_Q2_2006\\AverageFare_Q3_2004.xls.csv", header=TRUE)
df13<-read.csv("C:\\Northeastern\\Semester4\\ADS\\Final Project\\Python2.7\\AverageFare_Q2_2006\\AverageFare_Q3_2005.xls.csv", header=TRUE)
df14<-read.csv("C:\\Northeastern\\Semester4\\ADS\\Final Project\\Python2.7\\AverageFare_Q2_2006\\AverageFare_Q3_2006.xls.csv", header=TRUE)
df15<-read.csv("C:\\Northeastern\\Semester4\\ADS\\Final Project\\Python2.7\\AverageFare_Q2_2006\\AverageFare_Q3_2007.xls.csv", header=TRUE)
df16<-read.csv("C:\\Northeastern\\Semester4\\ADS\\Final Project\\Python2.7\\AverageFare_Q2_2006\\AverageFare_Q4_2003.xls.csv", header=TRUE)
df17<-read.csv("C:\\Northeastern\\Semester4\\ADS\\Final Project\\Python2.7\\AverageFare_Q2_2006\\AverageFare_Q4_2004.xls.csv", header=TRUE)
df18<-read.csv("C:\\Northeastern\\Semester4\\ADS\\Final Project\\Python2.7\\AverageFare_Q2_2006\\AverageFare_Q4_2005.xls.csv", header=TRUE)
df19<-read.csv("C:\\Northeastern\\Semester4\\ADS\\Final Project\\Python2.7\\AverageFare_Q2_2006\\AverageFare_Q4_2006.xls.csv", header=TRUE)
df20<-read.csv("C:\\Northeastern\\Semester4\\ADS\\Final Project\\Python2.7\\AverageFare_Q2_2006\\AverageFare_Q4_2007.xls.csv", header=TRUE)
DF<-rbind(df1,df2,df3,df4,df5,df6,df7,df8,df9,df10,df11,df12,df13,df14,df15,df16,df17,df18,df19,df20)
write.csv(DF[,], file = "FinalPrices.csv",row.names=FALSE)
######################################
#Run Python Code
#########

setwd("C:\\Northeastern\\Semester4\\ADS\\Final Project\\Python2.7")
finalDF <- read.csv("FinalDataFile.csv", header=TRUE)
View(summary(finalDF))

#install.packages("zoo")
library(zoo)
finalDF$TemperatureF[is.na(finalDF$TemperatureF)] <-na.approx(finalDF$TemperatureF)
finalDF$WindDirDegrees[is.na(finalDF$WindDirDegrees)] <-na.approx(finalDF$WindDirDegrees)
finalDF$VisibilityMPH[is.na(finalDF$VisibilityMPH)] <-na.approx(finalDF$VisibilityMPH)
finalDF$Sea_Level_PressureIn[is.na(finalDF$Sea_Level_PressureIn)] <-na.approx(finalDF$Sea_Level_PressureIn)
finalDF$Humidity[is.na(finalDF$Humidity)] <-na.approx(finalDF$Humidity)
finalDF$Dew_PointF[is.na(finalDF$Dew_PointF)] <-na.approx(finalDF$Dew_PointF)
View(summary(finalDF))

tempF<-finalDF[finalDF$Diverted!='1',]
#write.csv(tempF[,], file = "NAREMOVED.csv",row.names=FALSE)
View(summary(tempF))


################
###Removing outliers
################

#install.packages("zoo")
library(zoo)
#naremoveddataset<- read.csv("NAREMOVED.csv")
naremoveddataset<- tempF
nrow(naremoveddataset)
View(summary(naremoveddataset))
# temperature
boxplot(naremoveddataset$TemperatureF)
out <- which(naremoveddataset$TemperatureF < -100, arr.ind = TRUE)
naremoveddataset <- naremoveddataset[-out,]
boxplot(naremoveddataset$TemperatureF)
#Dew_PointF
boxplot(naremoveddataset$Dew_PointF)
#Sea_Level_PressureIn
boxplot(naremoveddataset$Sea_Level_PressureIn)
out <- which(naremoveddataset$Sea_Level_PressureIn < -100, arr.ind = TRUE)
naremoveddataset <- naremoveddataset[-out,]
boxplot(naremoveddataset$Sea_Level_PressureIn)
View(summary(naremoveddataset))

#VisibilityMPH
boxplot(naremoveddataset$VisibilityMPH)
out <- which(naremoveddataset$VisibilityMPH < -100, arr.ind = TRUE)
naremoveddataset <- naremoveddataset[-out,]
boxplot(naremoveddataset$VisibilityMPH)
out <- which(naremoveddataset$VisibilityMPH >10, arr.ind = TRUE)
naremoveddataset <- naremoveddataset[-out,]
boxplot(naremoveddataset$VisibilityMPH)
View(summary(naremoveddataset))
#WindDirDegrees
boxplot(naremoveddataset$WindDirDegrees)

View(summary(naremoveddataset))

write.csv(naremoveddataset, file = "Finalremovedoutliers.csv",row.names=F)


###################
#Feature Selection for classfication
###################

require(leaps)
require(MASS)
setwd("C:\\Northeastern\\Semester4\\ADS\\Final Project\\Python2.7\\")
inputRead<- read.csv("Finalremovedoutliers.csv", header=TRUE)
reg1<-regsubsets(Cancelled~Year+Month+DayofMonth+DayOfWeek+FlightNum+Hour+Quarter+TemperatureF+Dew_PointF
+Humidity+Sea_Level_PressureIn+VisibilityMPH+WindDirDegrees,data=inputRead,nvmax=6)
reg3 = regsubsets(Cancelled~Year+Month+DayofMonth+DayOfWeek+FlightNum+Hour+Quarter+TemperatureF+Dew_PointF
                  +Humidity+Sea_Level_PressureIn+VisibilityMPH+WindDirDegrees,data=inputRead, method = "backward")
reg4 = regsubsets(Cancelled~Year+Month+DayofMonth+DayOfWeek+FlightNum+Hour+Quarter+TemperatureF+Dew_PointF
                  +Humidity+Sea_Level_PressureIn+VisibilityMPH+WindDirDegrees,data=inputRead, method = "forward")
summary(reg1)
summary(reg3)
summary(reg4)
VisibilityMPH+TemperatureF+FlightNum+Sea_Level_PressureIn+Hour+Year
VisibilityMPH+TemperatureF+Sea_Level_PressureIn+FlightNum+Hour

###################
#Feature Selection for prediction
###################

require(leaps)
require(MASS)
setwd("C:\\Northeastern\\Semester4\\ADS\\Final Project\\Python2.7\\")
inputRead<- read.csv("Finalremovedoutliers.csv", header=TRUE)
reg1<-regsubsets(DepDelay~Year+Month+DayofMonth+DayOfWeek+FlightNum+Hour+Quarter+TemperatureF+Dew_PointF
                 +Humidity+Sea_Level_PressureIn+VisibilityMPH+WindDirDegrees,data=inputRead,nvmax=6)
reg3 = regsubsets(DepDelay~Year+Month+DayofMonth+DayOfWeek+FlightNum+Hour+Quarter+TemperatureF+Dew_PointF
                  +Humidity+Sea_Level_PressureIn+VisibilityMPH+WindDirDegrees,data=inputRead, method = "backward",nvmax=6)
reg4 = regsubsets(DepDelay~Year+Month+DayofMonth+DayOfWeek+FlightNum+Hour+Quarter+TemperatureF+Dew_PointF
                  +Humidity+Sea_Level_PressureIn+VisibilityMPH+WindDirDegrees,data=inputRead, method = "forward",nvmax=6)
summary(reg1)--Hour+Year+VisibilityMPH+Sea_Level_PressureIn+FlightNum+Humidity
summary(reg3)--visiblityMPH+sealevel+temp+hour+dew_pointf+year
summary(reg4)--year+flightnum+hour+humidity+sea_level+visib

final--visib+sealevel+hour+year+flightnum+humidity


