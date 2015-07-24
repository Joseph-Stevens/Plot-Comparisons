# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from 
# all sources for each of the years 1999, 2002, 2005, and 2008.


# Read data in

data1<-readRDS("Source_Classification_Code.rds")
data3<-readRDS("summarySCC_PM25.rds")

# Create png, dimensions 480 x 480

png(filename = "plot1.png",width=480,height=480)  

# Sum total emissions by year
yr1<-data3[which(data3$year==1999),]
total1<-as.integer(sum(yr1[4]))
yr2<-data3[which(data3$year==2002),]
total2<-as.integer(sum(yr2[4]))
yr3<-data3[which(data3$year==2005),]
total3<-as.integer(sum(yr3[4]))
yr4<-data3[which(data3$year==2008),]
total4<-as.integer(sum(yr4[4]))

# Put totals in a matrix

sumData<-matrix()
Year<-c(1999,2002,2005,2008)
Totals<-c(total1,total2,total3,total4)
sumData<-cbind(Year,Totals)

# Plot matrix

plot(sumData, type="b", main = "U.S. Total PM2.5 Emissions")

# Close png

dev.off()  