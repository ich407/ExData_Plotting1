powerdata <- read.table(file='exploratorydata/household_power_consumption.txt', check.names=F, sep=';', header=T, stringsAsFactors=F)
powersubsetdata <- powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007") ,]

Global_active_power <- as.numeric(powersubsetdata$Global_active_power)

png("plot1.png", width=504, height=504)

hist(Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")

dev.off()