## Getting full dataset
pw <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
               nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
pw$Date <- as.Date(pw$Date, format="%d/%m/%Y")

## Subsetting the data
subpw <- subset(pw, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(pw)

## Converting dates
hl <- paste(as.Date(subpw$Date), subpw$Time)
subpw$Datetime <- as.POSIXct(hl)

## Plot 1
hist(subpw$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="./plot1.png", height=480, width=480)
dev.off()