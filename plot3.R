# Question 3
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
# Which have seen increases in emissions from 1999-2008?

library(ggplot2)

# read the dataset
emissions <- readRDS("summarySCC_PM25.rds")

baltimoreEmissions <- subset(emissions, emissions$fips=="24510")

aggregates <- aggregate(Emissions ~ type + year,baltimoreEmissions, sum)

png("plot3.png", width=480, height=480, units = "px")

plot3 <- qplot(year, Emissions, data=aggregates, facets = . ~ type) +  
  geom_line() +
  xlab("Year") +
  ylab("PM2.5 Emissions (tons)") +
  ggtitle("Total PM2.5 Emissions in Baltimore City")

print(plot3)

dev.off()