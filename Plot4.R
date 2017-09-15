# Reading in complete Data
AllData <- read.csv(file = "household_power_consumption.txt", sep = ";")

# Subsetting Data, using the rows
startRow <- min(which(AllData$Date == "1/2/2007"))
endRow <- max(which(AllData$Date == "2/2/2007"))
MyData <- AllData[startRow:endRow, ] # Use of the dplyr package

# Convert 'Date' to Date format
MyData$datetime <- strptime(paste(MyData$Date, MyData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Check for NAs, inscripted as "?"
sum("?" %in% MyData) 
# Since sum is zero, we conclude there aren't any NAs.

## STARTING PLOTS 4

# Making Data numeric
MyData$Global_active_power <- as.numeric(MyData$Global_active_power)
MyData$Sub_metering_1 <- as.numeric(MyData$Sub_metering_1)
MyData$Sub_metering_2 <- as.numeric(MyData$Sub_metering_2)
MyData$Global_reactive_power <- as.numeric(MyData$Global_reactive_power)
MyData$Voltage <- as.numeric(MyData$Voltage)

#Constructing the Plots
par(mfrow = c(2, 2))

# Plot 4.1
with(MyData, plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power"))

# Plot 4.2
with(MyData, plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage"))

# Plot 4.3
with(MyData, plot(datetime, MyData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
lines(MyData$datetime, MyData$Sub_metering_2, type = "l", col = 'red')
lines(MyData$datetime, MyData$Sub_metering_3, type = "l", col = 'blue')
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col=c("black", "red", "blue"), cex = 0.25)

# Plot 4.4
with(MyData, plot(datetime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))

# Saving Plot
dev.print(png, 'Plot4.png', width = 480, height = 480)

