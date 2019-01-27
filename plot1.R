library(dplyr)
library(lubridate)
#Read data and select data betweem 2007-02-01 to 2007-02-02

data <- read.table("household_power_consumption.txt", sep = ";", header = T, stringsAsFactors = FALSE)
data$Date <- dmy(data$Date)
data_sel <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
data_sel <- na.omit(data_sel)
data_sel[3:9] <- sapply(data_sel[3:9], as.numeric)

#plotting
png("plot1.png")
hist(data_sel$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
