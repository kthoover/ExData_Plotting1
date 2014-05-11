

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


par(mfrow = c(1, 1))


# Plot 3:  Make sur variables are numeric and create an x-y line plot
power$Sub_metering_1 <- as.numeric(as.character(power$Sub_metering_1))
power$Sub_metering_2 <- as.numeric(as.character(power$Sub_metering_2))
power$Sub_metering_3 <- as.numeric(as.character(power$Sub_metering_3))

png(file = "plot3.png")
plot(newtime, power$Sub_metering_1, type="l", xlab = "", ylab = "Energey sub metering")
lines(newtime, power$Sub_metering_2, col = "red")
lines(newtime, power$Sub_metering_3, col = "blue")
legend("topright", lwd=1, col = c("black",  "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off() 

