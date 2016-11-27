
# setwd("D:/Coursera_EDA_with_R/Project_1")

power_consump <- read.table("household_power_consumption.txt", 
                            sep = ";", header = TRUE,
                            na.strings = "?")


colnames(power_consump)

power_consump <- power_consump[power_consump$Date == "1/2/2007" | 
                                 power_consump$Date == "2/2/2007", ]


# power_consump <- na.omit(power_consump)
# row.names(power_consump) <- 1:nrow(power_consump

datetime <- paste(power_consump$Date, power_consump$Time)

datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")


png(filename = "plot4.png",
    width = 480, height = 480,
    units = "px")

par(mfcol = c(2,2))

plot(datetime, power_consump$Global_active_power, type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

plot(datetime, power_consump$Sub_metering_1, type = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(datetime, power_consump$Sub_metering_2, col = "red")
lines(datetime, power_consump$Sub_metering_3, col = "blue")
legend("topright",
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", 
                  "Sub_metering_3"),
       lty = c(1,1,1),
       bty = "n")

with(power_consump, plot(datetime, Voltage, type = "l"))
with(power_consump, plot(datetime, Global_reactive_power, type = "l"))

dev.off()