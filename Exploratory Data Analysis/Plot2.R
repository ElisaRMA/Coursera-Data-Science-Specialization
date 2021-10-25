#Plot 2

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
# (fips == "24510"\color{red}{\verb|fips == "24510"|}fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

#read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#prepare data for plot
BALT <- subset(NEI, fips == "24510")
BALTy <- split(BALT$Emissions, BALT$year)

library(dplyr)
BALtyy <- group

sumbalt <- sapply(BALTy, sum)

## open device
png("plot2.png", width = 480, height = 480, units = "px" )

barplot(sumbalt, main = "Total PM2.5 emissions in Baltimore City, Maryland", xlab = 'Year', ylab = "Emission (tons)")

## close device
dev.off()
