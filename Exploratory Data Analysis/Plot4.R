#Plot 4

## Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

# read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC1 <- readRDS("Source_Classification_Code.rds")

# preparing data

SCC <- as.character(SCC1$SCC)
eisector <- as.character(SCC1$EI.Sector)
sc <- cbind(SCC, eisector)
mg <- merge(NEI, sc, by = "SCC")
mg$eisector <- as.factor(mg$eisector)
levels(mg$eisector)
c <- grep("Coal$", mg$eisector)
coal <- subset(mg[c(c) , ])

# plot using ggplot2 
library(ggplot2)

png("plot4.png", width = 960, height = 480, units = "px")

ggplot(coal, aes(factor(year), Emissions )) + 
  geom_bar(stat="identity") +
  facet_grid(.~eisector,scales = "free") + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons) ")) + 
  labs(title=expression("PM"[2.5]*" Emissions (tons) from coal Combustion-related sources"))

dev.off()
