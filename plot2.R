# Loading data
originalDataSet <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 	nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
originalDataSet$Date <- as.Date(originalDataSet$Date, format="%d/%m/%Y")

# Pruning data
DataSubset <- subset(originalDataSet, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
# Releasing memory removing originalDataSet
rm(originalDataSet)

# Dates conversion
datetime <- paste(as.Date(DataSubset$Date), DataSubset$Time)
DataSubset$Datetime <- as.POSIXct(datetime)

# Creating chart
plot(DataSubset$Global_active_power~DataSubset$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

# Saving plot1.png chart
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off() #- close the two X devices