
# setwd("D:/Coursera_EDA_with_R/Project_1")

power_consump <- read.table("household_power_consumption.txt", 
                      sep = ";", header = TRUE,
                      na.strings = "?")


colnames(power_consump)

power_consump <- power_consump[power_consump$Date == "1/2/2007" | 
                               power_consump$Date == "2/2/2007", ]


# power_consump <- na.omit(power_consump)
# row.names(power_consump) <- 1:nrow(power_consump)

png(filename = "plot1.png",
    width = 480, height = 480,
    units = "px")

hist(power_consump$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

dev.off()

