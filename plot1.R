
#read in data 
library(data.table)
dataset <- fread("household_power_consumption.txt", header = TRUE, na.strings = "?")

# filter data for 2007-02-01 and 2007-02-02, and then combine date and time
dataset$Date <- as.Date(dataset$Date, format = "%d/%m/%Y")
dataset <- subset(dataset, Date >= "2007-02-01" & Date <= "2007-02-02")

dataset$Date_time <-as.POSIXct(paste(dataset$Date,dataset$Time), format="%Y-%m-%d %H:%M:%S")

######### Plot1
# create plot
hist(dataset$Global_active_power, col="red", main= "Global Active Power", 
     xlab = "Global Active Power (kilowatts)" )
# save to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
