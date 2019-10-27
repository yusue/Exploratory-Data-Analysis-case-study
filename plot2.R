setwd("/Users/yusue/Downloads/")

zipF<- "/Users/yusue/Downloads/exdata_data_NEI_data.zip"
outDir<-"/Users/yusue/Downloads"
unzip(zipF,exdir=outDir)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(dplyr)
BCtotal <-filter(NEI,fips=="24510")
BC_emission<-summarise(group_by(BCtotal,year),Emissions=sum(Emissions))
png("/Users/yusue/Documents/GitHub/Exploratory-Data-Analysis-course-project2/plot2.png")
par(mfrow=c(1,1),mar=c(4,4,4,4))
with(BC_emission,plot(year,Emissions, col="blue", main="Baltimore City total Emissions"))
dev.off()