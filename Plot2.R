
baltimoreNEI <- NEI[NEI$fips=="24510",]
aggTotalsBaltimore <- aggregate(Emissions ~ year, baltimoreNEI,sum)

##Now we use the base plotting system to make a plot of this data,

png(filename = "plot2.png", width = 480, height = 480, units = "px")

barplot(
  aggTotalsBaltimore$Emissions,
  names.arg=aggTotalsBaltimore$year,
  xlab="Year",
  ylab="PM2.5 Emissions (Tons)",
  main="Total PM2.5 Emissions From All Baltimore City Sources"
)

# Close the PNG device
dev.off()


##Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008?
##Overall total emissions from PM2.5 have decreased in Baltimore City, Maryland from 1999 to 2008.
