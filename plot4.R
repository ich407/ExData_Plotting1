powerdata <- read.table(file='exploratorydata/household_power_consumption.txt', check.names=F, sep=';', header=T, stringsAsFactors=F)
powersubsetdata <- powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007") ,]

powerdatetime <- strptime(paste(powersubsetdata$Date, powersubsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Global_active_power <- as.numeric(powersubsetdata$Global_active_power)
Global_reactive_power <- as.numeric(powersubsetdata$Global_reactive_power)
Voltage <- as.numeric(powersubsetdata$Voltage)
Sub_metering_1 <- as.numeric(powersubsetdata$Sub_metering_1)
Sub_metering_2 <- as.numeric(powersubsetdata$Sub_metering_2)
Sub_metering_3 <- as.numeric(powersubsetdata$Sub_metering_3)

png("plot4.png", width=504, height=504)
par(mfrow = c(2, 2)) 

plot(powerdatetime, Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(powerdatetime, Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(powerdatetime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(powerdatetime, Sub_metering_2, type="l", col="red")
lines(powerdatetime, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

plot(powerdatetime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()