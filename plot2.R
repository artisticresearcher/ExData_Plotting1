t <- read.table('household_power_consumption.txt', header=TRUE, sep=";",
                na.strings = "?", colClasses = c('character','character','numeric',
                                                 'numeric','numeric','numeric','numeric'
                                                 ,'numeric','numeric'))
t$DateTime <- strptime(paste(t$Date, t$Time), "%d/%m/%Y %H:%M:%S")
data <- subset(t, as.Date(DateTime) >= as.Date("2007-02-01") & 
                 as.Date(DateTime) <= as.Date("2007-02-02"))

plot(data$DateTime,
     data$Global_active_power,
     pch=NA, xlab = "", ylab = "Global Active Power(kilowatts)")
lines(data$DateTime, data$Global_active_power)

#Save the plot

dev.copy(png, "plot2.png",
         width = 480, 
         height = 480)
dev.off()