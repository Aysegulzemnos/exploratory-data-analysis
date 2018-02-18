
library(ggplot2)

##baltimoreNEI <- NEI[NEI$fips=="24510",] Bunu KONTROL ET


##Open the PNG device

png(filename = "plot3.png", width = 480, height = 480, units = "px")

ggp <- ggplot(baltimoreNEI,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  theme_bw() + guides(fill=FALSE)+
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))

print(ggp)
## Close the PNG device
dev.off()


