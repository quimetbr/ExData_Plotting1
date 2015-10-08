# This is the script to create the plot1.png

# Load the data and filter only the days 1/2/2007 and 2/2/2007
alldata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
filterData <- alldata[alldata$Date %in% c("1/2/2007","2/2/2007") ,]

# Create the plot
filterData$globalActivePower <- as.numeric(filterData$$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()