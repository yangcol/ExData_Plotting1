ha <- read.csv("new_power_consumption.txt")
ha[,"Date"] <- as.Date(strptime(ha[,"Date"], "%d/%m/%Y")) ## 把factor 转到Date
mydata <- ha
mydata[, "Global_active_power"] <- as.numeric(mydata[, "Global_active_power"])
Sys.setlocale("LC_TIME", "en_US")

full_time <- paste(mydata$Date, as.character(mydata$Time), sep = "-")
mydata$Full_time <- strptime(full_time, "%Y-%m-%d-%H:%M:%S")
plot(mydata$Full_time, mydata$Sub_metering_1, type="l", col="black", ylab = "Energy sub metering")
lines(mydata$Full_time, mydata$Sub_metering_2, col="red")
lines(mydata$Full_time, mydata$Sub_metering_3, col="blue")
legend("topright",col=c("black", "red", "blue"), bty="n",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty='solid')
#plot(mydata$Full_time, mydata$, ylab = "Global Active Power(killowatts)", type = "l", xlab = "")
dev.copy(png, "plog3.png")
dev.off()