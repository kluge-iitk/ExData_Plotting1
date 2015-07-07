file <- "./household_power_consumption.txt"

Data <- read.table(file, header = TRUE, sep = ';', na.strings = "?", 
stringsAsFactors = FALSE, 
colClasses = c(replicate(2,"character"), replicate(7, "numeric")))

Data <- subset(Data, Date == '1/2/2007' | Date == '2/2/2007')

Data$Datetime <- strptime(paste(Data$Date, Data$Time), format = "%d/%m/%Y %H:%M:%S")

png("plot4.png", 480, 480, "px", bg = "transparent")

par(mfrow = c(2,2))

plot(Data$Datetime, Data$Global_active_power, type = 'l', xlab = "", ylab = "Global Active Power",
col = rgb(18, 18, 18, maxColorValue = 255))
plot(Data$Datetime, Data$Voltage, type = 'l', xlab = 'datetime', ylab = 'Voltage')
plot(Data$Datetime, Data$Sub_metering_1, type = 'l', xlab = "", ylab = "Energy sub metering")

points(Data$Datetime, Data$Sub_metering_2, type = 'l', col = "red")
points(Data$Datetime, Data$Sub_metering_3, type = 'l', col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1,1), bty = 'n', cex = 0.9)
plot(Data$Datetime, Data$Global_reactive_power, type = 'l', xlab = 'datetime', ylab = 'Global_reactive_power', col = rgb(18, 18, 18, maxColorValue = 255))

dev.off()