library(readr)
library(dplyr)

data_full <- read_delim("household_power_consumption.txt", delim = ";", na = c("?"))
data4 <- filter(data_full, Date %in% c("1/2/2007", "2/2/2007")) %>%
        mutate(Date = as.Date(Date, "%d/%m/%Y")) %>%
        mutate(Datetime = paste(Date, Time)) %>%
        mutate(Datetime = as.POSIXct(Datetime))
png("plot4.png")
par(mfrow = c(2,2), mar = c(3, 4, 2, 1), oma = c(1, 0, 4, 0))
with(data4, {
        with(data2, plot(Global_active_power ~ Datetime, type = "l", ylab = 'Global Active Power(killowatts)'))        
        with(data4, plot(Voltage ~ Datetime, type = "l", xlab = "Voltage", ylab = "Datetime"))
        with(data4, plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Energy sub metering"))
        with(data4, lines(Datetime, Sub_metering_2, col = "red"))
        with(data4, lines(Datetime, Sub_metering_3, col = "blue"))
        legend("topright", col =c("black", "red", "blue"),lty = 1, lwd = 2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        with(data4, plot(Global_reactive_power ~ Datetime, type = "l"))
})
dev.off()
