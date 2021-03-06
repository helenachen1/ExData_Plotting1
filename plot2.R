#read in data 
library(data.table)
dataset <- fread("household_power_consumption.txt", header = TRUE, na.strings = "?")

# filter data for 2007-02-01 and 2007-02-02, and then combine date and time
dataset$Date <- as.Date(dataset$Date, format = "%d/%m/%Y")
dataset <- subset(dataset, Date >= "2007-02-01" & Date <= "2007-02-02")

dataset$Date_time <-as.POSIXct(paste(dataset$Date,dataset$Time), format="%Y-%m-%d %H:%M:%S")

###### Plot2
plot(dataset$Date_time, dataset$Global_active_power,
     ylab="Global Active Power (kilowatts)",xlab="",pch =".", type="l")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()