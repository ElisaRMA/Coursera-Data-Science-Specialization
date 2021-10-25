#Plot 1 
#data obtained here: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip

#Question 1

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all 
# sources for each of the years 1999, 2002, 2005, and 2008.

# read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#preparing data for plot
NEIbyyear <- split(NEI$Emissions, NEI$year)
sum <- sapply(NEIbyyear, sum)

#open device
png("plot1.png", width = 480, height = 480, units = "px" )

#plot
barplot(sum, main = "Total PM2.5 emissions", xlab = 'Year', ylab = "Emission (tons)")

#close device
dev.off()


