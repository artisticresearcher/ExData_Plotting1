t <- read.table('household_power_consumption.txt', header=TRUE, sep=";",
                na.strings = "?", colClasses = c('character','character','numeric',
                                                 'numeric','numeric','numeric','numeric'
                                                 ,'numeric','numeric'))
t$DateTime <- strptime(paste(t$Date, t$Time), "%d/%m/%Y %H:%M:%S")
data <- subset(t, as.Date(DateTime) >= as.Date("2007-02-01") & 
                 as.Date(DateTime) <= as.Date("2007-02-02"))

plot(data$DateTime, data$Sub_metering_1,
     pch = NA,
     xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_1)
lines(data$DateTime, data$Sub_metering_2, col = 'red')
lines(data$DateTime, data$Sub_metering_3, col = 'blue')
legend('topright', c("Sub_metering_1", "Sub_metering_2",
                     "Sub_metering_3"),
       lty = c(1, 1, 1),
       col = c('black', 'red', 'blue'))

dev.copy(png, "plot3.png",
         width = 480, 
         height = 480)
dev.off()