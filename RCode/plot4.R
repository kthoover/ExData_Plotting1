
# Load data file and unzip contents into dataframe called data
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.txt"), sep = ";", header =TRUE)
unlink(temp)
#summary(data)
#str(data)


# Subset data to include only the days of Feb. 1 and Feb.2 in 2007
power = subset(data, (data$Date == "1/2/2007" | data$Date == "2/2/2007"))


# Make numbers are formated as numbers and date-times as something R can read
power$Global_active_power <-as.numeric(as.character(power$Global_active_power))

temp1 <- gsub("/", "-", as.character(power$Date))
temp2 <- paste (temp1, as.character(power$Time), sep = " ")
newtime <- strptime(temp2, format="%d-%m-%Y %H:%M:%S")

power$Sub_metering_1 <- as.numeric(as.character(power$Sub_metering_1))
power$Sub_metering_2 <- as.numeric(as.character(power$Sub_metering_2))
power$Sub_metering_3 <- as.numeric(as.character(power$Sub_metering_3))

power$Voltage <- as.numeric(as.character(power$Voltage))
power$Global_reactive_power <- as.numeric(as.character(power$Global_reactive_power))


# Plot 4:  Plot the four small plots 
png(file = "plot4.png")
par(mfrow = c(2, 2))
plot(newtime, power$Global_active_power, type="l", xlab = "", ylab = "Global Active Power" )
plot(newtime, power$Voltage, type="l", xlab = "datatime", ylab = "Voltage")
plot(newtime, power$Sub_metering_1, type="l", xlab = "", ylab = "Energey sub metering")
lines(newtime, power$Sub_metering_2, col = "red")
lines(newtime, power$Sub_metering_3, col = "blue")
legend("topright", lwd=1, cex=0.9, bty="n", col = c("black",  "red", "blue"), legend = c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 "))
#legend("topright", lwd=1, col = c("black",  "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(newtime, power$Global_reactive_power, type="l", xlab = "datatime", ylab = "Global_reaactive_power") 
dev.off() 


