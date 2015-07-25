# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make 
# a plot answer this question.



# Load ggplot2 library

library (ggplot2)

# Read data in

data1<-readRDS("Source_Classification_Code.rds")
data2<-readRDS("summarySCC_PM25.rds")

# Subset by Baltimore City data only

data3<-data2[which(data2$fips=="24510"),]

# Create png, dimensions 480 x 480

png(filename = "plot3.png",width=480,height=480)  

# Sum total emissions by year and type

data4<-data3[which(data3$type=="POINT"),]
yr1<-data4[which(data4$year==1999),]
total1<-sum(yr1[4])
yr2<-data4[which(data4$year==2002),]
total2<-sum(yr2[4])
yr3<-data4[which(data4$year==2005),]
total3<-sum(yr3[4])
yr4<-data4[which(data4$year==2008),]
total4<-sum(yr4[4])

data4<-data3[which(data3$type=="NONPOINT"),]
yr1<-data4[which(data4$year==1999),]
total5<-sum(yr1[4])
yr2<-data4[which(data4$year==2002),]
total6<-sum(yr2[4])
yr3<-data4[which(data4$year==2005),]
total7<-sum(yr3[4])
yr4<-data4[which(data4$year==2008),]
total8<-sum(yr4[4])

data4<-data3[which(data3$type=="ON-ROAD"),]
yr1<-data4[which(data4$year==1999),]
total9<-sum(yr1[4])
yr2<-data4[which(data4$year==2002),]
total10<-sum(yr2[4])
yr3<-data4[which(data4$year==2005),]
total11<-sum(yr3[4])
yr4<-data4[which(data4$year==2008),]
total12<-sum(yr4[4])

data4<-data3[which(data3$type=="NON-ROAD"),]
yr1<-data4[which(data4$year==1999),]
total13<-sum(yr1[4])
yr2<-data4[which(data4$year==2002),]
total14<-sum(yr2[4])
yr3<-data4[which(data4$year==2005),]
total15<-sum(yr3[4])
yr4<-data4[which(data4$year==2008),]
total16<-sum(yr4[4])

# Put totals in a data frame

sumData<-data.frame()
Year<-c(1999,2002,2005,2008,1999,2002,2005,2008,1999,2002,2005,2008,1999,2002,2005,2008)
Totals<-c(total1,total2,total3,total4,total5,total6,total7,total8,total9,total10,total11,total12,total13,total14,total15,total16)
Types<-c("POINT","POINT","POINT","POINT","NONPOINT","NONPOINT","NONPOINT","NONPOINT","ON-ROAD","ON-ROAD","ON-ROAD","ON-ROAD","NON-ROAD","NON-ROAD","NON-ROAD","NON-ROAD")
for (i in 1:16){sumData[i,1]<-Year[i]}
for (i in 1:16){sumData[i,2]<-Totals[i]}
for (i in 1:16){sumData[i,3]<-Types[i]}

names(sumData)<-c("Year","Totals","Type")

# Plot data frame

# plot(sumData, type="b", main = "Baltimore City Total PM2.5 Emissions")
# 
g<-ggplot(sumData,aes(Year,Totals)) + geom_line() + facet_grid(.~Type)
print (g)

# Close png

dev.off()  
