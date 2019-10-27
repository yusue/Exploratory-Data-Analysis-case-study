setwd("/Users/yusue/Downloads/")

zipF<- "/Users/yusue/Downloads/exdata_data_NEI_data.zip"
outDir<-"/Users/yusue/Downloads"
unzip(zipF,exdir=outDir)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(dplyr)
BCtotal <-filter(NEI,fips=="24510")
type_emission<-summarise(group_by(BCtotal,year,type),Emissions=sum(Emissions))
png("/Users/yusue/Documents/GitHub/Exploratory-Data-Analysis-course-project2/plot3.png")
ggplot(type_emission,aes(year,Emissions)) + geom_point()+facet_grid(.~type)
dev.off()
