powerdata <- read.table(file='exploratorydata/household_power_consumption.txt', check.names=F, sep=';', header=T, stringsAsFactors=F)
powersubsetdata <- powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007") ,]

powerdatetime <- strptime(paste(powersubsetdata$Date, powersubsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Global_active_power <- as.numeric(powersubsetdata$Global_active_power)

png("plot2.png", width=504, height=504)

plot(powerdatetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()