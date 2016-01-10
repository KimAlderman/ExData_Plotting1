data <- read.table("household_power_consumption.txt", header=TRUE, 
                   sep = ";")
data$Date <- as.Date(data$Date, format='%d/%m/%Y')
subdata <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]
glActivePower <- as.numeric(subdata$Global_active_power)
png("plot1.png", width=480, height=480)
hist(glActivePower, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
