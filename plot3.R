# This is the script to create the plot3.png
# My SO is in Portuguese so Thursday, Friday and Saturday change to Quinta, Sexta and Sabado
# Load the data and filter only the days 1/2/2007 and 2/2/2007
alldata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
filterData <- alldata[alldata$Date %in% c("1/2/2007","2/2/2007") ,]

# Create the plot
filterData$datetime <- strptime(paste(filterData$Date, filterData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
filterData$globalActivePower <- as.numeric(filterData$Global_active_power)
filterData$subMetering1 <- as.numeric(filterData$Sub_metering_1)
filterData$subMetering2 <- as.numeric(filterData$Sub_metering_2)
filterData$subMetering3 <- as.numeric(filterData$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(filterData$datetime, filterData$subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(filterData$datetime, filterData$subMetering2, type="l", col="red")
lines(filterData$datetime, filterData$subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
