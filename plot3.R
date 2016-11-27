
# setwd("D:/Coursera_EDA_with_R/Project_1")

power_consump <- read.table("household_power_consumption.txt", 
                            sep = ";", header = TRUE,
                            na.strings = "?")


colnames(power_consump)

power_consump <- power_consump[power_consump$Date == "1/2/2007" | 
                                 power_consump$Date == "2/2/2007", ]


# power_consump <- na.omit(power_consump)
# row.names(power_consump) <- 1:nrow(power_consump

date_time <- paste(power_consump$Date, power_consump$Time)

x <- strptime(date_time, "%d/%m/%Y %H:%M:%S")


png(filename = "plot3.png",
    width = 480, height = 480,
    units = "px")

plot(x, power_consump$Sub_metering_1, type = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(x, power_consump$Sub_metering_2, col = "red")
lines(x, power_consump$Sub_metering_3, col = "blue")
legend("topright",
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", 
                  "Sub_metering_3"),
       lty = c(1,1,1))

dev.off()