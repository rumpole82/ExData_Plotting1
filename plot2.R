#read and subset the data.
data <- fread(paste("grep ^[12]/2/2007", "household_power_consumption.txt"), 
              na.strings=c("?",""))

#get the column names, since they were not included in the subset.
setnames(data, colnames(fread("household_power_consumption.txt", nrows=0)))

#make a new column combining date and time.
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

#plot the data to a file.
png(filename="plot2.png")
par(bg="transparent")
plot(data$DateTime, data$Global_active_power, type="l", 
     ylab = paste("Global Active Power (kilowatts)"),
     xlab = paste(""))
dev.off()