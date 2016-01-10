data <- read.table("household_power_consumption.txt", header=TRUE, 
                   sep = ";")
data$Date <- as.Date(data$Date, format='%d/%m/%Y')
subdata <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]
glActivePower <- as.numeric(subdata$Global_active_power)
datetime_temp <- paste(as.Date(subdata$Date), subdata$Time)
datetime <- as.POSIXct(datetime_temp) 
png("plot2.png", width=480, height=480)
plot(datetime, glActivePower, type="l", xlab= "", ylab="Global Active Power (kilowatts)")
dev.off()
