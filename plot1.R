setwd("/Users/yusue/Downloads/")

zipF<- "/Users/yusue/Downloads/exdata_data_NEI_data.zip"
outDir<-"/Users/yusue/Downloads"
unzip(zipF,exdir=outDir)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
total_emission<-summarise(group_by(NEI,year),Emissions=sum(Emissions))

png("/Users/yusue/Documents/GitHub/Exploratory-Data-Analysis-course-project2/plot1.png")
par(mfrow=c(1,1),mar=c(4,4,4,4))
with(total_emission,plot(year,Emissions, col="red", main="Total Emissions"))
dev.off()


