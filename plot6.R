# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City? 

# Read data in

data1<-readRDS("Source_Classification_Code.rds")
data2<-readRDS("summarySCC_PM25.rds")

# Subset by Baltimore City data only

data3<-data2[which(data2$fips=="24510"),]

# Subset by coal-related data only

UniqueSector<-as.vector(unique(data1$EI.Sector))
coalSector<-UniqueSector[grep("Mobile",UniqueSector)]
x<-which(data1$EI.Sector==coalSector[1])
y<-which(data1$EI.Sector==coalSector[2])
z<-which(data1$EI.Sector==coalSector[3])
check<-c(x,y,z)
sccCheck<-as.vector((data1[check,1]))
checkLength<-length(sccCheck)
found<-vector()
for (i in 1:checkLength){
  found<-c(found,which(data3$SCC==sccCheck[i]))
}
data4<-data3[found,]

# Create png, dimensions 480 x 480

png(filename = "plot6.png",width=480,height=480)  

# place plots in 1 x 2 grid
par(mfrow = c(1,2))

# Sum total emissions by year
yr1<-data4[which(data4$year==1999),]
total1<-as.integer(sum(yr1[4]))
yr2<-data4[which(data4$year==2002),]
total2<-as.integer(sum(yr2[4]))
yr3<-data4[which(data4$year==2005),]
total3<-as.integer(sum(yr3[4]))
yr4<-data4[which(data4$year==2008),]
total4<-as.integer(sum(yr4[4]))

# Put totals in a matrix

sumData<-matrix()
Year<-c(1999,2002,2005,2008)
Totals<-c(total1,total2,total3,total4)
sumData<-cbind(Year,Totals)

# Generate Pie Chart

a1<-total1-total4
a2<-a1/total1
slices<-c(a1,total1-a1)
lbls <- c("Decrease", "2008 levels")
a<-pie(slices, labels = lbls, main="Baltimore")
print(a)

# Subset by Los Angeles County data only

data5<-data2[which(data2$fips=="06037"),]

# Subset by coal-related data only

UniqueSector<-as.vector(unique(data1$EI.Sector))
coalSector<-UniqueSector[grep("Mobile",UniqueSector)]
x<-which(data1$EI.Sector==coalSector[1])
y<-which(data1$EI.Sector==coalSector[2])
z<-which(data1$EI.Sector==coalSector[3])
check<-c(x,y,z)
sccCheck<-as.vector((data1[check,1]))
checkLength<-length(sccCheck)
found<-vector()
for (i in 1:checkLength){
  found<-c(found,which(data5$SCC==sccCheck[i]))
}
data6<-data5[found,]

# Sum total emissions by year
yr1<-data6[which(data6$year==1999),]
total5<-as.integer(sum(yr1[4]))
yr2<-data6[which(data6$year==2002),]
total6<-as.integer(sum(yr2[4]))
yr3<-data6[which(data6$year==2005),]
total7<-as.integer(sum(yr3[4]))
yr4<-data6[which(data6$year==2008),]
total8<-as.integer(sum(yr4[4]))

# Put totals in a matrix

sumData<-matrix()
Year<-c(1999,2002,2005,2008)
Totals<-c(total5,total6,total7,total8)
sumData<-cbind(Year,Totals)

# Generate Pie Chart

b1<-total5-total8
b2<-b1/total5
slices<-c(b1,total5-b1)
lbls <- c("Decrease", "2008 levels")
b<-pie(slices, labels = lbls, main="Los Angeles")
print (b)

# Close png

dev.off()  
