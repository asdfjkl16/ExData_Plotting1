library(data.table)
file <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
file$Datetime <- paste(file$Date, file$Time)
file$Datetime <- strptime(file$Datetime, "%d/%m/%Y %H:%M:%S")
subset <- subset(file, Date == "1/2/2007" | Date =="2/2/2007", na.rm=TRUE)
png(file = "plot1.png", bg = "transparent", width = 480, height = 480, units = "px")
hist(as.numeric(subset$Global_active_power), col="Red", main="Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
