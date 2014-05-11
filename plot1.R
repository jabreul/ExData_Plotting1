# loading data
household_power_consumption <- read.csv("/media/60/devel/eda_data/household_power_consumption.txt", sep=";")
# convert Date field to a class Date
household_power_consumption$Date <- as.Date(household_power_consumption$Date, format='%d/%m/%Y')

# working data is a subset of the data
wdata <- subset(household_power_consumption, Date > as.Date("2007-01-31"))
wdata <- subset(wdata, Date < as.Date("2007-02-03"))
# remove objects that are not going to be used any more
rm(household_power_consumption)

wdata$Global_active_power <- as.numeric(wdata$Global_active_power)

# writing file
png("plot1.png")
hist(wdata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power(Kilowatts)")
dev.off()
