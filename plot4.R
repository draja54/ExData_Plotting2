##Load ggplot2 library
library(ggplot2)

## Reading summarySCC_PM25.rds data into R
NEI <- readRDS("summarySCC_PM25.rds")

## Reading Source_Classification_Code.rds data into R
SCC <- readRDS("Source_Classification_Code.rds")

# Subset coal combustion related NEI data
combustionRelated <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coalRelated <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
coalCombustion <- (combustionRelated & coalRelated)
combustionSCC <- SCC[coalCombustion,]$SCC
combustionNEI <- NEI[NEI$SCC %in% combustionSCC,]

## Using ggplot function to plot and store in variable g
g <- ggplot(combustionNEI,aes(factor(year),Emissions/10^5))

##Creating a file plot4.png
png("plot4.png")

##Plotting the Coal Combustion Source Emission by Year in a barplot(using ggplot2)
g + geom_bar(stat="identity",fill="grey",width=0.75) +
  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Coal Combustion Source Emissions Across US from 1999-2008"))

##Closing the plot window
dev.off()