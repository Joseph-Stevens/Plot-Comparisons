# Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

# Read data in

data1<-readRDS("Source_Classification_Code.rds")
data2<-readRDS("summarySCC_PM25.rds")

# Subset by coal-related data only

UniqueSector<-as.vector(unique(data1$EI.Sector))
coalSector<-UniqueSector[grep("Coal",UniqueSector)]
x<-which(data1$EI.Sector==coalSector[1])
y<-which(data1$EI.Sector==coalSector[2])
z<-which(data1$EI.Sector==coalSector[3])
check<-c(x,y,z)
sccCheck<-as.vector((data1[check,1]))
checkLength<-length(sccCheck)
found<-vector()
for (i in 1:checkLength){
  found<-c(found,which(data2$SCC==sccCheck[i]))
}
data3<-data2[found,]

# Create png, dimensions 480 x 480

png(filename = "plot4.png",width=480,height=480)  

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

plot(sumData, type="b", main = "Total Emissions from Coal sources")

# Close png

dev.off()  
