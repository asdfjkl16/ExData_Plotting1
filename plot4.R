library(data.table)
file <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
file$Datetime <- paste(file$Date, file$Time)
file$Datetime <- strptime(file$Datetime, "%d/%m/%Y %H:%M:%S")
subset <- subset(file, Date == "1/2/2007" | Date =="2/2/2007", na.rm=TRUE)
png(file = "plot4.png", bg = "transparent", width = 480, height = 480, units = "px")
par(mfrow = c(2,2))
#plot1
plot(subset$Datetime, subset$Global_active_power,type = "l", col="Black", main = "", 
     xlab ="", ylab = "Global Active Power")
#plot2
plot(subset$Datetime, subset$Voltage,type = "l", col="Black", main = "", 
     xlab ="datetime", ylab = "Voltage")
#plot3
plot(subset$Datetime, subset$Sub_metering_1,type = "l", col="Black", main = "", 
     xlab ="", ylab = "Energy sub metering")
lines(subset$Datetime, subset$Sub_metering_2,col="Red")
lines(subset$Datetime, subset$Sub_metering_3,col="Blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
       col = c(1,2,4),lty=c(1,1,1),bty="n",cex=0.8)
#plot4
plot(subset$Datetime, subset$Global_reactive_power,type = "l", col="Black", main = "", 
     xlab ="datetime", ylab = "Global_reactive_power")
dev.off()