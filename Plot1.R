household <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE, stringsAsFactors = FALSE)
household$Date <- as.Date(household$Date, format = "%d/%m/%Y")
household$Time <- strptime(household$Time, "%H:%M:%S")
sub(".*\\s+", "",  household$Time)
household <- household[household$Date == "2007-02-01" |household$Date == "2007-02-02" ,]

par(mfrow=c(1,1))
par(mar=c(5.1,4.1,4.1,2.1))
png(filename = "Plot1.png", 
    width = 480, height = 480, units = "px")

hist(household$Global_active_power, main ="Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()
