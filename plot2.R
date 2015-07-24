# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
# from 1999 to 2008? Use the base plotting system to make a plot answering this question.

data1<-readRDS("Source_Classification_Code.rds")
data2<-readRDS("summarySCC_PM25.rds")
data3<-data2[which(data2$fips==24510),]
yr1<-data3[which(data3$year==1999),]
total1<-sum(yr1[4])
yr2<-data3[which(data3$year==2002),]
total2<-sum(yr2[4])
yr3<-data3[which(data3$year==2005),]
total3<-sum(yr3[4])
yr4<-data3[which(data3$year==2008),]
total4<-sum(yr4[4])
barplot(c(total1,total2,total3,total4))