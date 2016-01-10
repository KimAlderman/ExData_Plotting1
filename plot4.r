data <- read.table("household_power_consumption.txt", header=TRUE, 
                   sep = ";", stringsAsFactors=FALSE)
data$Date <- as.Date(data$Date, format='%d/%m/%Y')
subdata <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]

datetime_temp <- paste(as.Date(subdata$Date), subdata$Time)
datetime <- as.POSIXct(datetime_temp)
glActivePower <- as.numeric(subdata$Global_active_power)
glReactivePower <- as.numeric(subdata$Global_reactive_power)
subMetering1 <- as.numeric(subdata$Sub_metering_1)
subMetering2 <- as.numeric(subdata$Sub_metering_2)
subMetering3 <- as.numeric(subdata$Sub_metering_3)
voltage <- as.numeric(subdata$Voltage)
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))

plot(datetime, glActivePower, type="l", xlab="", ylab="Global Active Power")

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", xlab= "", ylab="Energy sub metering")
lines(datetime, subMetering2, col="red")
lines(datetime, subMetering3, col="blue")
legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2)

plot(datetime, glReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
