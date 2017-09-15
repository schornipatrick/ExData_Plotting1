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

## STARTING PLOT 2

# Making Data numeric
MyData$Global_active_power <- as.numeric(MyData$Global_active_power)

# Constructing the plot
par(mfrow = c(1,1))
with(MyData, plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

# Save Plot
dev.print(png, 'Plot2.png', width = 480, height = 480)





