setwd("/Users/yusue/Downloads/")

zipF<- "/Users/yusue/Downloads/exdata_data_NEI_data.zip"
outDir<-"/Users/yusue/Downloads"
unzip(zipF,exdir=outDir)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coalmatch<-SCC[grepl("[Cc]oal",SCC$Short.Name), ]
coalemission <- NEI[NEI$SCC %in% coalmatch$SCC,]
coal_emission_year<-aggregate(coalemission$Emissions,by=list(coalemission$year),FUN = sum)
colnames(coal_emission_year)<-c("year","Emissions")
png("/Users/yusue/Documents/GitHub/Exploratory-Data-Analysis-course-project2/plot4.png")
with(coal_emission_year,plot(year,Emissions, col="blue", main="coal combustion-related Emissions from 1999 to 2008"))
dev.off()
