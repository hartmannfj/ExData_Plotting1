# read in data
mydata <- read.csv("household_power_consumption.csv",
                   sep = ";", na.strings = "?", stringsAsFactors = FALSE)


# subset for the two dates
sub_data <- subset(mydata, Date %in% c("1/2/2007","2/2/2007"))


# convert date into date format
datetime <- strptime(paste(sub_data$Date, sub_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


# make three overlayed line plots
png("plot3.png", width = 480, height = 480)
plot(datetime, sub_data$Sub_metering_1, type = "l", ylab = "Energy sub metering",
     xlab = "", col = "black")
lines(datetime, sub_data$Sub_metering_2, col = "red")
lines(datetime, sub_data$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()




