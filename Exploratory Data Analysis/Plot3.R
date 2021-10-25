#Plot 3

# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

library(ggplot2)

#read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#prepare data for plot
BALT <- subset(NEI, fips == "24510")

## open device
png("plot3.png", width = 480, height = 480, units = "px" )

ggplot(BALT, aes(factor(year), Emissions )) + 
  geom_bar(stat="identity") +
  facet_grid(.~type,scales = "free") + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))


## close device
dev.off()
