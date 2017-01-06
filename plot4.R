#Sys.setenv(LANG = "en")
Sys.setlocale("LC_ALL", 'en_US.UTF-8')
dataset <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
plot4 <- subset(dataset, Date == "1/2/2007" | Date == "2/2/2007")
#concatenate date and time
DateTime <- paste(plot4$Date,plot4$Time)
png(filename = "plot4.png",width = 480, height = 480)
par(mfrow = c(2,2))
#1
hist(as.numeric(plot4$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)")
#2
plot(strptime(DateTime, "%d/%m/%Y %H:%M:%S"),plot4$Voltage,type = "l", xlab = "datetime", ylab = "Voltage")
#3
plot(strptime(DateTime, "%d/%m/%Y %H:%M:%S"),plot4$Sub_metering_1,type = "l", xlab = "", ylab = "Energy sub metering")
lines(strptime(DateTime, "%d/%m/%Y %H:%M:%S"),plot4$Sub_metering_2,type = "l", col = "red")
lines(strptime(DateTime, "%d/%m/%Y %H:%M:%S"),plot4$Sub_metering_3,type = "l", col = "purple")
legend("topright",lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#4
plot(strptime(DateTime, "%d/%m/%Y %H:%M:%S"),plot4$Global_reactive_power,type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()