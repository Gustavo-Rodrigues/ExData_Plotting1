#rawData <- read.csv("household_power_consumption.txt",header = TRUE,sep = ";")
dataset <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
plot1 <- subset(dataset, Date == "1/2/2007" | Date == "2/2/2007")
png(filename = "plot1.png",width = 480, height = 480)
hist(as.numeric(plot1$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)")
dev.off()

