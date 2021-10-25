
#-------------Q6-------------#

# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County,
# California (fips == "06037"). Which city has seen greater changes over time 
# in motor vehicle emissions?

## read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC1 <- readRDS("Source_Classification_Code.rds")

#prepare data
SCC <- as.character(SCC1$SCC)
scctwo <- as.character(SCC1$SCC.Level.Two)
sc <- cbind(SCC, scctwo)
mg <- merge(NEI, sc, by = "SCC")
BALTLA <- subset(mg, fips == c("24510", "06037"))
BALTLA$scctwo <- as.factor(BALTLA$scctwo)
levels(BALT$scctwo)
vhbla<- grep("Vehicle", BALTLA$scctwo)
vehicles <- subset(BALTLA[c(vhbla), ])

#changes the names of the fips for the city names
vehicles$fips <- factor(vehicles$fips, levels = c("24510", "06037"), labels = c("Los Angeles", "Baltimore"))

#plot
png("plot6.png", width = 960, height = 480, units = "px")

ggplot(vehicles, aes(factor(year), Emissions )) + 
  geom_bar(stat="identity") +
  facet_grid(fips~scctwo,scales = "free") +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons) ")) + 
  labs(title=expression("PM"[2.5]*"Emissions (tons) from vehicle sources in Baltimore and Los Angeles"))

dev.off()

