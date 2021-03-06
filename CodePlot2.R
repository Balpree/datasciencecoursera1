setwd("~/Downloads")
t <- read.table("/Users/bovikaur/Downloads/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
## Format date to Type Date
t$Date <- as.Date(t$Date, "%d/%m/%Y")
## Filter data set from Feb. 1, 2007 to Feb. 2, 2007
t <- subset(t,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
## Remove incomplete observation
t <- t[complete.cases(t),]
## Combine Date and Time column
dateTime <- paste(t$Date, t$Time)
## Remove Date and Time column
t <- t[ ,!(names(t) %in% c("Date","Time"))]
## Add DateTime column
t <- cbind(dateTime, t)
## Format dateTime Column
t$dateTime <- as.POSIXct(dateTime)
## Create the histogram PLOT 2
plot(t$Global_active_power~t$dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
#dev.copy(png,"plot2.png", width=480, height=480)
#dev.off()