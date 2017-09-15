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

## STARTING PLOT 3

# Making Data numeric
MyData$Sub_metering_1 <- as.numeric(MyData$Sub_metering_1)
MyData$Sub_metering_2 <- as.numeric(MyData$Sub_metering_2)

# Constructing the plot
par(mfrow = c(1,1))
with(MyData, plot(datetime, MyData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
lines(MyData$datetime, MyData$Sub_metering_2, type = "l", col = 'red')
lines(MyData$datetime, MyData$Sub_metering_3, type = "l", col = 'blue')
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col=c("black", "red", "blue"), cex = 0.5)

# Save Plot
dev.print(png, 'Plot3.png', width = 480, height = 480)




