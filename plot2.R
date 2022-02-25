library(data.table)
file <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
file$Datetime <- paste(file$Date, file$Time)
file$Datetime <- strptime(file$Datetime, "%d/%m/%Y %H:%M:%S")
subset <- subset(file, Date == "1/2/2007" | Date =="2/2/2007", na.rm=TRUE)
png(file = "plot2.png", bg = "transparent", width = 480, height = 480, units = "px")
plot(subset$Datetime, subset$Global_active_power,type = "l", col="Black", main = "", 
     xlab ="", ylab = "Global Active Power (kilowatts)")
dev.off()