#read and subset the data.
install.packages("data.table")
library(data.table)
data <- fread(paste("grep ^[12]/2/2007", "household_power_consumption.txt"), 
              na.strings=c("?",""))

#get the column names, since they were not included in the subset.
setnames(data, colnames(fread("household_power_consumption.txt", nrows=0)))

#plot the data to a file.
png(filename="plot1.png")
par(bg="transparent")
hist(data$Global_active_power, main = paste("Global Active Power"), col = "red",
     xlab = paste("Global Active Power (kilowatts)"))
dev.off()