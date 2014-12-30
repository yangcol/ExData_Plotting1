## Plot1
ha <- read.csv("new_power_consumption.txt")
ha[,"Date"] <- as.Date(strptime(ha[,"Date"], "%d/%m/%Y")) ## 把factor 转到Date
mydata <- ha
mydata[, "Global_active_power"] <- as.numeric(mydata[, "Global_active_power"])
hist(mydata$Global_active_power / 1000, xlab = "Gblobal Active Power(kilowatts)",main = "Global Active Power", col = "red",xlim = c(0,6), xaxt="n")
axis(1, c(0,2,4,6))
dev.copy(png, "plot1.png")
dev.off()