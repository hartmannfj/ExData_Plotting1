# read in data
mydata <- read.csv("household_power_consumption.csv",
                sep = ";", na.strings = "?", stringsAsFactors = FALSE)


# subset for the two dates
sub_data <- subset(mydata, Date %in% c("1/2/2007","2/2/2007"))



# convert date into date format
datetime <- strptime(paste(sub_data$Date, sub_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
str(datetime)



# make line plot
png("plot2.png", width = 480, height = 480)
plot(datetime, sub_data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)",
     xlab = "")
dev.off()


