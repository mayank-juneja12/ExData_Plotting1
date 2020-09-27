library(readr)
library(dplyr)
data_full <- read_delim("household_power_consumption.txt", delim = ";", na = c("?"))
data3 <- filter(data_full, Date %in% c("1/2/2007", "2/2/2007")) %>%
        mutate(Date = as.Date(Date, "%d/%m/%Y")) %>%
        mutate(Datetime = paste(Date, Time)) %>%
        mutate(Datetime = as.POSIXct(Datetime))
png("plot3.png")
with(data3, plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Energy sub metering"))
with(data3, lines(Datetime, Sub_metering_2, col = "red"))
with(data3, lines(Datetime, Sub_metering_3, col = "blue"))
legend("topright", col =c("black", "red", "blue"),lty = 1, lwd = 2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
