## Reading summarySCC_PM25.rds data into R
NEI <- readRDS("summarySCC_PM25.rds")

## Reading Source_Classification_Code.rds data into R
SCC <- readRDS("Source_Classification_Code.rds")

## Using subset function to get the Baltimore data
NEIBaltimore<-subset(NEI, fips == "24510")

## Using Aggregate function to get the emission by Year
totalEmissionBaltimore <- aggregate(Emissions ~ year, NEIBaltimore, sum)

##Creating a file plot2.png
png(filename = "plot2.png")

##Plotting the Emission by Year in a barplot
barplot(
  (totalEmissionBaltimore$Emissions)/10^3,
  names.arg=totalEmissionBaltimore$year,
  xlab="Year",
  ylab="PM2.5 Emissions (Kilo Tons)",
  main="Total PM2.5 Emissions From All Baltimore City Sources"
)

##Closing the plot window
dev.off()
