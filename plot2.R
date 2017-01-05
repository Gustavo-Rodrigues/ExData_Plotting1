#Sys.setenv(LANG = "en")
Sys.setlocale("LC_ALL", 'en_US.UTF-8')
dataset <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
plot2 <- subset(dataset, Date == "1/2/2007" | Date == "2/2/2007")
#concatenate date and time
DateTime <- paste(plot2$Date,plot2$Time)
png(filename = "plot2.png",width = 480, height = 480)
plot(strptime(DateTime, "%d/%m/%Y %H:%M:%S"),plot2$Global_active_power,type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()