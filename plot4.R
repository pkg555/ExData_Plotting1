##Plot-4

setwd("~/Desktop/Coursera")
df <- "./household_power_consumption.txt"
data <- read.table(df, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Convert to Date Format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#Subset Data by Date
data1 <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02") )

# datetime
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)


grPower <- as.numeric(data1$Global_reactive_power)
voltage <- as.numeric(data1$Voltage)
gaPower <- as.numeric(data1$Global_active_power)
sm1 <- as.numeric(data1$Sub_metering_1)
sm2 <- as.numeric(data1$Sub_metering_2)
sm3 <- as.numeric(data1$Sub_metering_3)

# Plot 4
par(mfrow = c(2, 2))
plot(data1$Datetime, gaPower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(data1$Datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(data1$Datetime, sm1, type="l", ylab="Energy Submetering", xlab="")
lines(data1$Datetime, sm2, type="l", col="red")
lines(data1$Datetime, sm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), bty="n", cex=0.5 )

plot(data1$Datetime, grPower, type="l", xlab="datetime", ylab="Global_reactive_power")

## Save Plot to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()