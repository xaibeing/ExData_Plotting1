
power <- read.table("household_power_consumption.txt", sep=";", header = TRUE, fill = FALSE, strip.white=TRUE, stringsAsFactors=FALSE)
power$DateTime <- strptime( paste( power$Date, power$Time ), format="%d/%m/%Y %H:%M:%S" )

power$Date <- as.Date( power$Date, format="%d/%m/%Y" )
power <- subset( power, power$Date >= "2007-02-01" & power$Date <= "2007-02-02" )

power$Global_active_power <- as.numeric( power$Global_active_power )
power$Global_reactive_power <- as.numeric( power$Global_reactive_power )
power$Voltage <- as.numeric( power$Voltage )
power$Global_intensity <- as.numeric( power$Global_intensity )
power$Sub_metering_1 <- as.numeric( power$Sub_metering_1 )
power$Sub_metering_2 <- as.numeric( power$Sub_metering_2 )

png( file="plot3.png" )
plot( power$DateTime, power$Sub_metering_1, xlab="", ylab="Energy sub metering", type="n" )
lines( power$DateTime, power$Sub_metering_1, col="black" )
lines( power$DateTime, power$Sub_metering_2, col="red" )
lines( power$DateTime, power$Sub_metering_3, col="blue" )
legend("topright", lwd=c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
