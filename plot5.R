setwd("/Users/yusue/Downloads/")

zipF<- "/Users/yusue/Downloads/exdata_data_NEI_data.zip"
outDir<-"/Users/yusue/Downloads"
unzip(zipF,exdir=outDir)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(dplyr)
BCtotal <-filter(NEI,fips=="24510")
vehiclematch <-SCC[grepl("[Vv]eh",SCC$Short.Name), ]
vehicle_BC <- BCtotal[BCtotal$SCC %in% vehiclematch$SCC, ]
Vehicle_emission <- aggregate(vehicle_BC$Emissions,by=list(vehicle_BC$year),FUN=sum)
colnames(Vehicle_emission)<-c("year","Emissions")
png("/Users/yusue/Documents/GitHub/Exploratory-Data-Analysis-course-project2/plot5.png")
ggplot(Vehicle_emission,aes(year,Emissions))+geom_point(color="red", size=4)+ggtitle("motor vehicle sources changed from 1999???2008 in Baltimore City")
dev.off()