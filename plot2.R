library(readr)
library(dplyr)
data_full <- read_delim("household_power_consumption.txt", delim = ";", na = c("?"))
data2 <- filter(data_full, Date %in% c("1/2/2007", "2/2/2007")) %>%
        mutate(Date = as.Date(Date, "%d/%m/%Y")) %>%
        mutate(Datetime = paste(Date, Time)) %>%
        mutate(Datetime = as.POSIXct(Datetime))
png("plot2.png")
with(data2, plot(Global_active_power ~ Datetime, type = "l", ylab = 'Global Active Power(killowatts)'))        
dev.off()
