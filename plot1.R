## Reading summarySCC_PM25.rds data into R
NEI <- readRDS("summarySCC_PM25.rds")

## Reading Source_Classification_Code.rds data into R
SCC <- readRDS("Source_Classification_Code.rds")

## Using Aggregate function to get the emission by Year
totalEmission <- aggregate(Emissions ~ year, NEI, sum)

##Creating a file plot1.png
png(filename = "plot1.png")

##Plotting the Emission by Year in a barplot
barplot(
  (totalEmission$Emissions)/10^6,
  names.arg=totalEmission$year,
  xlab="Year",
  ylab="PM2.5 Emissions (Million Tons)",
  main="Total PM2.5 Emissions From All US Sources"
)

##Closing the plot window
dev.off()