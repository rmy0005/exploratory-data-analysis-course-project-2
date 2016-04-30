# Question 5
# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

# read the dataset
emissions <- readRDS("summarySCC_PM25.rds")

# read scc dateset
scc <- readRDS("Source_Classification_Code.rds")

baltimoreMotorEmissions <-  emissions[emissions$type == 'ON-ROAD' & emissions$fips == '24510', ]

baltimoreMotorEmissionsByYear <- aggregate(Emissions ~ year, data = baltimoreMotorEmissions, FUN = sum)

png(filename='plot5.png', width=480, height=480, units='px')

with(baltimoreMotorEmissionsByYear, {
  plot(year, Emissions, type = 'b',
       xlab="Year",
       ylab='PM2.5 Emissions (tons)',
       main='PM2.5 Emissions from motor vehicle sources in Baltimore City')
})

dev.off()
                                           