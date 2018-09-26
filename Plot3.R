household <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE, stringsAsFactors = FALSE)
household$Date <- as.Date(household$Date, format = "%d/%m/%Y")
household <- household[household$Date == "2007-02-01" |household$Date == "2007-02-02" ,]
household$datetime <- as.POSIXct(paste(household$Date, household$Time))

par(mfrow=c(1,1))
par(mar=c(5.1,4.1,4.1,2.1))
png(filename = "Plot3.png", 
    width = 480, height = 480, units = "px")

plot.new()
plot(
      household$datetime,household$Sub_metering_1,  
      type = "l", 
      xlab = "", 
      ylab = "Energy sub metering",
      col = "black")

lines(household$datetime, household$Sub_metering_2, type = "l", col ="red")
lines(household$datetime, household$Sub_metering_3, type = "l", col ="blue")
legend("topright", pch = "", lty = 1, lwd = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"))
dev.off()
