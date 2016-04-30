# Question 2
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008?

# read the dataset
emissions <- readRDS("summarySCC_PM25.rds")

baltimoreEmissions <- subset(emissions, emissions$fips=="24510")

aggregates <- aggregate(Emissions ~ year,baltimoreEmissions, sum)

png("plot2.png", width=480, height=480, units = "px")

plot(aggregates$year, aggregates$Emissions, type='b', xlab="Year", 
     ylab="PM2.5 Emissions (tons)",
     main="Total PM2.5 Emissions in U.S.A.")

dev.off()