file <- "./household_power_consumption.txt"

Data <- read.table(file, header = TRUE, sep = ';', na.strings = "?", 
stringsAsFactors = FALSE, 
colClasses = c(replicate(2,"character"), replicate(7, "numeric")))

Data <- subset(Data, Date == '1/2/2007' | Date == '2/2/2007')

Data$Datetime <- strptime(paste(Data$Date, Data$Time), format = "%d/%m/%Y %H:%M:%S")

png("plot2.png", 480, 480, "px", bg = "transparent")

plot(Data$Datetime, Data$Global_active_power, type = 'l', xlab = "", ylab = "Global Active Power (kilowatts)",
col = rgb(18, 18, 18, maxColorValue = 255))
dev.off()