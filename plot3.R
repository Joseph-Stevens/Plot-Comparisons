# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make 
# a plot answer this question.


data1<-readRDS("Source_Classification_Code.rds")
data2<-readRDS("summarySCC_PM25.rds")
data3<-data2[which(data2$fips==24510),]

# ggplot(data3,aes(year,Emissions)) + geom_point() + facet_grid(.~type)
# 
data4<-data3[which(data3$type=="NON-ROAD"),]
yr1<-data4[which(data4$year==1999),]
total1<-sum(yr1[4])
yr2<-data4[which(data4$year==2002),]
total2<-sum(yr2[4])
yr3<-data4[which(data4$year==2005),]
total3<-sum(yr3[4])
yr4<-data4[which(data4$year==2008),]
total4<-sum(yr4[4])
barplot(c(total1,total2,total3,total4))