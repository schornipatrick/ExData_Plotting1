# Reading in complete Data
AllData <- read.csv(file = "household_power_consumption.txt", sep = ";")

# Subsetting Data, using the rows
startRow <- min(which(AllData$Date == "1/2/2007"))
endRow <- max(which(AllData$Date == "2/2/2007"))
MyData <- AllData[startRow:endRow, ] # Use of the dplyr package

# Convert 'Date' to Date format
MyData$Date <- as.Date(strptime(MyData$Date, format = "%d/%m/%Y"))

# Check for NAs, inscripted as "?"
sum("?" %in% MyData) 
# Since sum is zero, we conclude there aren't any NAs.

## STARTING PLOT 1

# Making Data numeric
MyData$Global_active_power <- as.numeric(MyData$Global_active_power)

# Constructing Histogram
par(mfrow = c(1,1))
hist(MyData$Global_active_power, main = "Global Active Power", xlab = "Global active Power (kilowatts)", col = 'red')

# Save histogram
dev.print(png, 'Plot1.png', width = 480, height = 480)
