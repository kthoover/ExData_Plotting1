

# Load data file and unzip contents into dataframe called data
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.txt"), sep = ";", header =TRUE)
unlink(temp)
#summary(data)
#str(data)


# Subset data to include only the days of Feb. 1 and Feb.2 in 2007
power = subset(data, (data$Date == "1/2/2007" | data$Date == "2/2/2007"))
#str(power)
#tail(power)


# Plot 2:  Create a new date-time the R program will recognize and create an x-y line plot of active power versus time
par(mfrow = c(1, 1))
power$Global_active_power <-as.numeric(as.character(power$Global_active_power))
temp1 <- gsub("/", "-", as.character(power$Date))
temp2 <- paste (temp1, as.character(power$Time), sep = " ")
newtime <- strptime(temp2, format="%d-%m-%Y %H:%M:%S")

png(file = "plot2.png")
plot(newtime, power$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)" )
dev.off() 


