
#read in data 
library(data.table)
dataset <- fread("household_power_consumption.txt", header = TRUE, na.strings = "?")

# filter data for 2007-02-01 and 2007-02-02, and then combine date and time
dataset$Date <- as.Date(dataset$Date, format = "%d/%m/%Y")
dataset <- subset(dataset, Date >= "2007-02-01" & Date <= "2007-02-02")

dataset$Date_time <-as.POSIXct(paste(dataset$Date,dataset$Time), format="%Y-%m-%d %H:%M:%S")



###### Plot3

plot(dataset$Date_time,dataset$Sub_metering_1,ylab="Energy sub metering", xlab="", type="l", col="black")
points(dataset$Date_time,dataset$Sub_metering_2, col="red", type="l")
points(dataset$Date_time,dataset$Sub_metering_3, col="blue", type="l")
legend("topright", lwd=1, col=c("black", "red", "blue"), legend=names(dataset[,7:9]))

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
