##Plot-2

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

# Plot 2
plot(data1$Global_active_power~data1$Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")

## Save Plot to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()