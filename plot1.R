##Plot-1

setwd("~/Desktop/Coursera")
df <- "./household_power_consumption.txt"
data <- read.table(df, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Convert to Date Format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#Subset Data by Date
data1 <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02") )

#Plot 1
hist(as.numeric(data1$Global_active_power), main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Save Plot to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()