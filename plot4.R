# read in data
mydata <- read.csv("household_power_consumption.csv",
                   sep = ";", na.strings = "?", stringsAsFactors = FALSE)


# subset for the two dates
sub_data <- subset(mydata, Date %in% c("1/2/2007","2/2/2007"))


# convert date into date format
datetime <- strptime(paste(sub_data$Date, sub_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


# plot the four plots
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2)) 

plot(datetime, sub_data$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power", cex = 0.2)
plot(datetime, sub_data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(datetime, sub_data$Sub_metering_1, type = "l", ylab = "Energy sub metering",
     xlab = "", col = "black")
lines(datetime, sub_data$Sub_metering_2, col = "red")
lines(datetime, sub_data$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, bty = "n", col = c("black", "red", "blue"))
plot(datetime, sub_data$Global_reactive_power, type = "l", xlab = "datetime", 
     ylab = "Global_reactive_power")

dev.off()

