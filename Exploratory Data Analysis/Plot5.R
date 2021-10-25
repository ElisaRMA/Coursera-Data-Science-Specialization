#Plot5

# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

#read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC1 <- readRDS("Source_Classification_Code.rds")

#prepare data
SCC <- as.character(SCC1$SCC)
scctwo <- as.character(SCC1$SCC.Level.Two)
sc <- cbind(SCC, scctwo)
mg <- merge(NEI, sc, by = "SCC")
BALT <- subset(mg, fips == "24510")
BALT$scctwo <- as.factor(BALT$scctwo)
levels(BALT$scctwo)
v <- grep("Vehicle", BALT$scctwo)
vh <- subset(BALT[c(v), ])


#plot 
png("plot5.png", width = 960, height = 480, units = "px")

ggplot(vh, aes(factor(year), Emissions )) + 
  geom_bar(stat="identity") +
  facet_grid(.~scctwo,scales = "free") + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons) ")) + 
  labs(title=expression("PM"[2.5]*" Emissions (tons) from vehicle sources in Baltimore"))

dev.off()
