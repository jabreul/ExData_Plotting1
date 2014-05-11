household_power_consumption <- read.csv("/media/60/devel/eda_data/household_power_consumption.txt", sep=";")
# convert Date field to a class Date
household_power_consumption$Date <- as.Date(household_power_consumption$Date, format='%d/%m/%Y')
# working data is a subset of the data
wdata <- subset(household_power_consumption, Date > as.Date("2007-01-31"))
wdata <- subset(wdata, Date < as.Date("2007-02-03"))
# remove objects that are not going to be used any more
rm(household_power_consumption)

# concatenate the complete date-time fields and then build a new POSIX time column
wdata$cron <- paste(wdata$Date, wdata$Time)
wdata$cron <- as.POSIXlt(wdata$cron)

# writing file
png("plot4.png")
par(mfrow=c(2,2))

# sub plot1, Global Active Power
plot(wdata$cron, wdata$Global_active_power, type="l", ylab="Global Active Power", xlab="")

# sub plot2, Voltage
plot(wdata$cron, wdata$Voltage, type="l", ylab="Voltage", xlab="datetime")

# sub plot3, Energy sub metering
plot(wdata$cron, wdata$Sub_metering_1, type="s", xlab="", ylab="Energy sub meterig")
lines(wdata$cron, wdata$Sub_metering_2, col="red")
lines(wdata$cron, wdata$Sub_metering_3, col="blue")
legend("topright",c("sub metering_1","sub metering_2","sub metering_3"), lty=c(1,1,1), col=c("black","red","blue"))

# sub plot4, Global Reactive Power
plot(wdata$cron, wdata$Global_reactive_power, type="l", ylab="Global Reactive Power", xlab="datetime")

dev.off()
