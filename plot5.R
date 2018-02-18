library(ggplot2)

##First we subset the motor vehicles,  anything like Motor Vehicle in SCC.Level.Two.

vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]

## We subset for motor vehicles in Baltimore,

baltimoreVehiclesNEI <- vehiclesNEI[vehiclesNEI$fips==24510,]


##Open the PNG device

png(filename = "plot5.png", width = 480, height = 480, units = "px")



#Then Plot using ggplot2,

library(ggplot2)
ggp <- ggplot(baltimoreVehiclesNEI,aes(factor(year),Emissions)) +
  geom_bar(stat="identity",fill="grey",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))

print(ggp)

## Close the PNG device
dev.off()
