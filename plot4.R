t <- read.table('household_power_consumption.txt', header=TRUE, sep=";",
                na.strings = "?", colClasses = c('character','character','numeric',
                                                 'numeric','numeric','numeric','numeric'
                                                 ,'numeric','numeric'))
t$DateTime <- strptime(paste(t$Date, t$Time), "%d/%m/%Y %H:%M:%S")
data <- subset(t, as.Date(DateTime) >= as.Date("2007-02-01") & 
                 as.Date(DateTime) <= as.Date("2007-02-02"))

par(mfrow=c(2,2))

#plot4.1
plot(data$DateTime, data$Global_active_power, 
     pch=NA, 
     xlab="", ylab="Global Active Power (kilowatts)")
lines(data$DateTime, data$Global_active_power)

#plot4.2
plot(data$DateTime, data$Voltage,
     pch=NA,
     xlab="datetime", 
     ylab="Voltage")
lines(data$DateTime, data$Voltage)

#plot4.3
plot(data$DateTime, data$Sub_metering_1, 
     pch=NA, 
     xlab="", ylab="Energy sub metering")

lines(data$DateTime, data$Sub_metering_1)
lines(data$DateTime, data$Sub_metering_2, col='red')
lines(data$DateTime, data$Sub_metering_3, col='blue')
legend('topright', 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1),
       col = c('black', 'red', 'blue'),
       bty = 'n')

#plot4.4
with(data, plot(DateTime, Global_reactive_power, xlab='datetime', pch=NA))
with(data, lines(DateTime, Global_reactive_power))

dev.copy(png, "plot4.png",
         width = 480, 
         height = 480)

dev.off()
