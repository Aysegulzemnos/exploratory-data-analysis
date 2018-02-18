

library(ggplot2)
##First we subset coal combustion source factors NEI data.
## Subset coal combustion related NEI data
combustionRelated <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coalRelated <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
coalCombustion <- (combustionRelated & coalRelated)
combustionSCC <- SCC[coalCombustion,]$SCC
combustionNEI <- NEI[NEI$SCC %in% combustionSCC,]


##Note: The SCC levels go from generic to specific. 
##We assume that coal combustion related SCC records are those where SCC.
##Level.One contains the substring 'comb' and SCC.Level.Four contains the substring 'coal'.



##Open the PNG device

png(filename = "plot4.png", width = 480, height = 480, units = "px")

ggp <- ggplot(combustionNEI,aes(factor(year),Emissions/10^5)) +
  geom_bar(stat="identity",fill="grey",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Coal Combustion Source Emissions Across US from 1999-2008"))

print(ggp)

## Close the PNG device
dev.off()