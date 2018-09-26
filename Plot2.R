household <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE, stringsAsFactors = FALSE)
household$Date <- as.Date(household$Date, format = "%d/%m/%Y")
household <- household[household$Date == "2007-02-01" |household$Date == "2007-02-02" ,]
household$datetime <- as.POSIXct(paste(household$Date, household$Time))

par(mfrow=c(1,1))
par(mar=c(5.1,4.1,4.1,2.1))
png(filename = "Plot2.png", 
    width = 480, height = 480, units = "px")

plot.new()
plot(household$datetime,household$Global_active_power,  type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()


