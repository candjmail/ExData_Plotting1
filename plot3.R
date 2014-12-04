## set the working directory and read the household data
setwd("~/GitHub/datasciencecoursera/datasciencecoursera/ExData_Plotting1")
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.txt"),sep=";", header=TRUE, na.strings="?")
unlink(temp)
## convert the character date into a proper date class
data$DateTime <- paste(data$Date, data$Time, sep=" ")
data$DateTime <- strptime(data$DateTime, format="%d/%m/%Y %H:%M:%S", tz="GMT")

## now select only the 2 days in Feb. 2007 we're looking for
begDate <- strptime(c("2007-02-01 00:00:00 GMT"), format=c("%Y-%m-%d %H:%M:%S"), tz="GMT")
endDate <- strptime(c("2007-02-03 00:00:00 GMT"), format=c("%Y-%m-%d %H:%M:%S"), tz="GMT")
data <- subset(data, DateTime >= begDate & DateTime < endDate)
##
## create plot 3
##
png("plot3.png")
plot(data$DateTime, data$Sub_metering_1, type="l",
          ylab="Energy sub metering", xlab="")
points(data$DateTime, data$Sub_metering_2, type="l",
     col='red')
points(data$DateTime, data$Sub_metering_3, type="l",
     col='blue')
legend("topright",
       col = c("black", "red", "blue"), lty=1,
       legend = c("Sub_metering_1", "Sub_metering_2", 
                  "Sub_metering_3"), cex=.8)
dev.off()                         ## close the PNG device!