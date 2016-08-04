##Load ggplot2 library
library(ggplot2)

## Reading summarySCC_PM25.rds data into R
NEI <- readRDS("summarySCC_PM25.rds")

## Reading Source_Classification_Code.rds data into R
SCC <- readRDS("Source_Classification_Code.rds")

## Using subset function to get the Baltimore data
NEIBaltimore<-subset(NEI, fips == "24510")

## Using ggplot function to plot and store in variable g
g<-ggplot(aes(factor(year), Emissions, fill=type), data=NEIBaltimore)

##Creating a file plot3.png
png(filename = "plot3.png")

##Plotting the Emission by Year in a barplot(using ggplot2)
g + geom_bar(stat="identity")+
  facet_grid(.~type)+
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))+
  guides(fill=FALSE)

##Closing the plot window
dev.off()