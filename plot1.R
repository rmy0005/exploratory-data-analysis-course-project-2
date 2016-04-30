# Question 1
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?

# read the dataset
emissions <- readRDS("summarySCC_PM25.rds")

aggregates <- aggregate(Emissions ~ year,emissions, sum)

png("plot1.png", width=480, height=480, units = "px")

plot(aggregates$year, aggregates$Emissions, type='b', xlab="Year", 
     ylab="PM2.5 Emissions (tons)",
     main="Total PM2.5 Emissions in U.S.A.")

dev.off()