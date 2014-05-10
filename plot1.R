power <- read.table("household_power_consumption.txt", header=T, sep=";", colClasses = "character")
power$Global_active_power <- as.numeric(power$Global_active_power)
power$Date <- as.Date(power$Date, "%d/%m/%Y") 
powerSample <- power[power$Date == "2007-02-01" | power$Date == "2007-02-02",]
hist(powerSample$Global_active_power, main = "Global Active Power", xlab="Global Active Power (Kilowatts)", col="red")
dev.copy(png, file="plot1.png")
dev.off()