power <- read.table("household_power_consumption.txt", header=T, sep=";", colClasses = "character")
power$DateTime <- paste(power$Date, power$Time)
power$Date <- as.Date(power$Date, "%d/%m/%Y") 
power <- power[!is.na(power$Date) & power$Date == "2007-02-01" | power$Date == "2007-02-02",]
power$Global_active_power <- as.numeric(power$Global_active_power)
power$Sub_metering_1 <- as.numeric(power$Sub_metering_1)
power$Sub_metering_2 <- as.numeric(power$Sub_metering_2)
power$Sub_metering_3 <- as.numeric(power$Sub_metering_3)
power$Voltage <- as.numeric(power$Voltage)
power$Global_reactive_power <- as.numeric(power$Global_reactive_power)
power$DateTime <- strptime(power$DateTime, "%d/%m/%Y %H:%M:%S") 

par(mfrow=c(2,2))

#plot 1
plot(power$DateTime, power$Global_active_power, type="l", ylab="Global Active Power (Kilowatts)", xlab="")

#plot 2
plot(power$DateTime, power$Voltage, type="l", ylab="Voltage", xlab="datetime")

#plot 3
plot(power$DateTime, power$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(power$DateTime, power$Sub_metering_2, col="red")
lines(power$DateTime, power$Sub_metering_3, col="blue")
legend("topright", col = c("black", "red", "blue"), cex = 0.95, lty=1, legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#plot 4
plot(power$DateTime, power$Global_reactive_power, type="l", ylab="Global_Reactive_Power", xlab="datetime")

dev.copy(png, file="plot4.png")
dev.off()