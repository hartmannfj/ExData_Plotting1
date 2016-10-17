# read in data
mydata <- read.csv("household_power_consumption.csv",
                sep = ";", na.strings = "?", stringsAsFactors = FALSE)


# convert date into date format
Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
mydata$Date <- Date


# subset for the two dates
sub_data <- subset(mydata, Date %in% as.Date(c("2007-02-01", "2007-02-02")))


# make histogram
png("plot1.png", width=480, height=480)
hist(sub_data$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()


