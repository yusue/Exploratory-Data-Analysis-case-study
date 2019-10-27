setwd("/Users/yusue/Downloads/")

zipF<- "/Users/yusue/Downloads/exdata_data_NEI_data.zip"
outDir<-"/Users/yusue/Downloads"
unzip(zipF,exdir=outDir)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(dplyr)
BCandLA <-filter(NEI,fips=="24510"|fips=="06037")
vehiclematch <-SCC[grepl("[Vv]eh",SCC$Short.Name), ]
vehicle_BCandLA <- BCandLA[BCandLA$SCC %in% vehiclematch$SCC, ]
BCandLA_emission <- aggregate(vehicle_BCandLA$Emissions,by=list(vehicle_BCandLA$year,vehicle_BCandLA$fips),FUN=sum)
colnames(BCandLA_emission)<-c("year","city","Emissions")
BCandLA_emission$city <- replace(BCandLA_emission$city,BCandLA_emission$city=="06037","Los Angeles County")
BCandLA_emission$city <- replace(BCandLA_emission$city,BCandLA_emission$city=="24510","Baltimore City")
png("/Users/yusue/Documents/GitHub/Exploratory-Data-Analysis-course-project2/plot6.png")
ggplot(BCandLA_emission,aes(year,Emissions,color=city))+geom_point()+ggtitle("Motor Vehicle Source Emissions in Baltimore from 1999-2008")
dev.off()
