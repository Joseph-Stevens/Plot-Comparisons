# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
# from 1999 to 2008? Use the base plotting system to make a plot answering this question.

# Read data in

data1<-readRDS("Source_Classification_Code.rds")
data2<-readRDS("summarySCC_PM25.rds")
data3<-data2[which(data2$fips==24510),]

# Create png, dimensions 480 x 480

png(filename = "plot2.png",width=480,height=480)  

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

plot(sumData, type="b", main = "Baltimore City Total PM2.5 Emissions")

# Close png

dev.off()  
