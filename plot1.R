library(readr)
library(dplyr)
data_full <- read_delim("household_power_consumption.txt", delim = ";", na = c("?"))
data1 <- filter(data_full, Date %in% c("1/2/2007", "2/2/2007")) %>%
        mutate(Date = as.Date(Date, "%d/%m/%Y"))
head(data1$Global_active_power, 10)
class(data1$Global_active_power)
data1$Global_active_power = as.numeric(data1$Global_active_power)
png("plot1.png")
hist(data1$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power(killowatts)")
dev.off()
