# This is the script to create the plot2.png
# My SO is in Portuguese so Thursday, Friday and Saturday change to Quinta, Sexta and Sabado

# Load the data and filter only the days 1/2/2007 and 2/2/2007
alldata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
filterData <- alldata[alldata$Date %in% c("1/2/2007","2/2/2007") ,]

# Create the plot
datetime <- strptime(paste(filterData$Date, filterData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(filterData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
