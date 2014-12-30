## Plot1
ha <- read.csv("new_power_consumption.txt")
ha[,"Date"] <- as.Date(strptime(ha[,"Date"], "%d/%m/%Y")) ## 把factor 转到Date
mydata <- ha
mydata[, "Global_active_power"] <- as.numeric(mydata[, "Global_active_power"])
Sys.setlocale("LC_TIME", "en_US")

full_time <- paste(mydata$Date, as.character(mydata$Time), sep = "-")
mydata$Full_time <- strptime(full_time, "%Y-%m-%d-%H:%M:%S")
plot(mydata$Full_time, mydata$Global_active_power, ylab = "Global Active Power(killowatts)", type = "l", xlab = "")
dev.copy(png, "plog2.png")
dev.off()