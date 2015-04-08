#read and subset the data.
data <- fread(paste("grep ^[12]/2/2007", "household_power_consumption.txt"), 
              na.strings=c("?",""))

#get the column names, since they were not included in the subset.
setnames(data, colnames(fread("household_power_consumption.txt", nrows=0)))

#make a new column combining date and time.
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

#plot the data to a file.
png(filename="plot3.png")
par(bg="transparent")
plot(data$DateTime, data$Sub_metering_1, type="l", col="black", 
     ylab = paste("Energy sub metering"),
     xlab = paste(""))
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()