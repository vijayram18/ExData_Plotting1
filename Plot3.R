
# Read in text data & format date & time
rawdata <- read.csv("E:/WORK/Cousera MOOC R working/Lesson 4/household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
CDT <- paste(rawdata$Date, rawdata$Time)
FDT <- strptime(CDT, format = "%d/%m/%Y %H:%M:%S")
rawdata <- cbind(rawdata, FDT)
rawdata$Date <- as.Date(rawdata$Date, format = "%d/%m/%Y")

# subsetting data
fdata <- subset(rawdata, Date == as.Date("2007-02-02")| Date == as.Date("2007-02-01")) 

# Clean up & save space
rm(rawdata, CDT, FDT)

#Plot 3
png("plot3.png")
plot(fdata$FDT, fdata$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(fdata$FDT, fdata$Sub_metering_2, col = "red")
lines(fdata$FDT, fdata$Sub_metering_3, col = "blue")
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
dev.off()

# Clean up
rm(fdata)
