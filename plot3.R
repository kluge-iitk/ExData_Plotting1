file <- "./household_power_consumption.txt"

Data <- read.table(file, header = TRUE, sep = ';', na.strings = "?", 
stringsAsFactors = FALSE, 
colClasses = c(replicate(2,"character"), replicate(7, "numeric")))

Data <- subset(Data, Date == '1/2/2007' | Date == '2/2/2007')

Data$Datetime <- strptime(paste(Data$Date, Data$Time), format = "%d/%m/%Y %H:%M:%S")

png("plot3.png", 480, 480, "px", bg = "transparent")
plot(Data$Datetime, Data$Sub_metering_1, type = 'l', xlab = "", ylab = "Energy sub metering")

points(Data$Datetime, Data$Sub_metering_2, type = 'l', col = "red")
points(Data$Datetime, Data$Sub_metering_3, type = 'l', col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1,1))

dev.off()