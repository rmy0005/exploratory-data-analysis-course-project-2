# QUestion 4
# Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

# read the dataset
emissions <- readRDS("summarySCC_PM25.rds")

# read scc dateset
scc <- readRDS("Source_Classification_Code.rds")

coalSCC <- scc[grep('coal', scc$Short.Name), ]

coalEmissions <- emissions[emissions$SCC %in% coalSCC$SCC,]
coalEmissionsByYear <- aggregate(Emissions ~ year, data = coalEmissions, FUN = sum)

png(filename='plot4.png', width=480, height=480, units='px')

with(coalEmissionsByYear, {
  plot(year, Emissions, type = 'b',
       xlab="Year",
       ylab='PM2.5 Emissions (tons)',
       main='PM2.5 Emissions from coal combustion sources in U.S.A.')
})

dev.off()
