household <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE, stringsAsFactors = FALSE)
household$Date <- as.Date(household$Date, format = "%d/%m/%Y")
household <- household[household$Date == "2007-02-01" |household$Date == "2007-02-02" ,]
household$datetime <- as.POSIXct(paste(household$Date, household$Time))

plot.new()

par(mar=c(4,4,2,2))
png(filename = "Plot4.png", 
    width = 480, height = 480, units = "px")

par(mfrow=c(2,2))
plot(household$datetime,household$Global_active_power,  type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
plot(household$datetime,household$Voltage,  type = "l", xlab = "datetime", ylab = "Voltage")
plot(
      household$datetime,household$Sub_metering_1,  
      type = "l", 
      xlab = "", 
      ylab = "Energy sub metering",
      col = "black")
lines(household$datetime, household$Sub_metering_2, type = "l", col ="red")
lines(household$datetime, household$Sub_metering_3, type = "l", col ="blue")
plot(household$datetime,household$Global_reactive_power,  type = "l", xlab = "datetime")
dev.off()
