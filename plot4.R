library(dplyr)
library(lubridate)
#Read data and select data betweem 2007-02-01 to 2007-02-02

data <- read.table("household_power_consumption.txt", sep = ";", header = T, stringsAsFactors = FALSE)
data$Date <- dmy(data$Date)
data_sel <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
data_sel <- na.omit(data_sel)
data_sel[3:9] <- sapply(data_sel[3:9], as.numeric)
data_sel$Datetime <- ymd_hms(paste(data_sel$Date, data_sel$Time))

#plotting
png("plot4.png")
par(mfrow = c(2,2))

#plot1
plot(data_sel$Datetime, data_sel$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

#plot2
plot(data_sel$Datetime, data_sel$Voltage, type = "l", xlab = "datatime", ylab = "Voltage")

#plot3
plot(data_sel$Datetime, data_sel$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data_sel$Datetime, data_sel$Sub_metering_2, col ="red")
lines(data_sel$Datetime, data_sel$Sub_metering_3, col ="blue")
legend("topright", legend = c(colnames(data_sel[7:9])), col = c("black", "red", "blue"), lty = 1,  bty = "n", cex = 1, x.intersp = 0.1 )

#plot4
plot(data_sel$Datetime, data_sel$Global_reactive_power, type = "l", xlab = "datatime", ylab = "Global_reactive_power")
dev.off()
