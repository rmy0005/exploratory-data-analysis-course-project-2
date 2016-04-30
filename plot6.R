# Question 6
# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor 
# vehicle sources in Los Angeles County, California (fips == "06037").
# Which city has seen greater changes over time in motor vehicle emissions?

# read the dataset
emissions <- readRDS("summarySCC_PM25.rds")

# read scc dateset
scc <- readRDS("Source_Classification_Code.rds")

balLAEmissions <- emissions[emissions$type == 'ON-ROAD' & emissions$fips %in% c('24510','06037'), ]

balLAEmissionsByYear <- aggregate(Emissions ~ year + fips, data = balLAEmissions, FUN = sum)

balLAEmissionsByYear$city = balLAEmissionsByYear$fips
balLAEmissionsByYear[which(balLAEmissionsByYear$fips == '24510'), 'city'] = 'Baltimore City'
balLAEmissionsByYear[which(balLAEmissionsByYear$fips == '06037'), 'city'] = 'Los Angeles'
library(ggplot2)
png(filename='plot6.png', width=640, height=480, units='px')
plot6 <- qplot(year, Emissions, data=balLAEmissionsByYear, facets = . ~ fips) +  
  geom_line() +
  xlab("Year") +
  ylab('PM2.5 Emissions (tons)') +
  ggtitle('Total PM2.5 Emissions in Los Angeles (06037) and Baltimore City (24510)')

print(plot6)

dev.off()