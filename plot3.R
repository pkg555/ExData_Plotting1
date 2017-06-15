##Plot-3

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

sm1 <- as.numeric(data1$Sub_metering_1)
sm2 <- as.numeric(data1$Sub_metering_2)
sm3 <- as.numeric(data1$Sub_metering_3)

# Plot 3
plot(sm1 ~ data1$Datetime, type="l", ylab="Energy Submetering", xlab="")
lines(sm2 ~ data1$Datetime, type="l", col="red")
lines(sm3 ~ data1$Datetime, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

## Save Plot to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()