
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

#Plot 1
png("plot1.png")
hist(fdata$Global_active_power, main ="Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()

# Clean up
rm(fdata)