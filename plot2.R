power <- read.table("household_power_consumption.txt", header=T, sep=";", colClasses = "character")
power$DateTime <- paste(power$Date, power$Time)
power$Date <- as.Date(power$Date, "%d/%m/%Y") 
power <- power[!is.na(power$Date) & power$Date == "2007-02-01" | power$Date == "2007-02-02",]
power$Global_active_power <- as.numeric(power$Global_active_power)
power$DateTime <- strptime(power$DateTime, "%d/%m/%Y %H:%M:%S") 
plot(power$DateTime, power$Global_active_power, type="l", ylab="Global Active Power (Kilowatts)", xlab="")
dev.copy(png, file="plot2.png")
dev.off()