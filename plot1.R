file <- "./household_power_consumption.txt"

Data <- read.table(file, header = TRUE, sep = ';', na.strings = "?", 
stringsAsFactors = FALSE, 
colClasses = c(replicate(2,"character"), replicate(7, "numeric")))

Data <- subset(Data, Date == '1/2/2007' | Date == '2/2/2007')

png("plot1.png", 480, 480, "px", bg = "transparent")

hist(Data$Global_active_power, ylim = c(0,1200), xlab = "Global Active Power (kilowatts)", main = "Global Active Power",
col = rgb(255, 37, 0, maxColorValue = 255))

dev.off()
