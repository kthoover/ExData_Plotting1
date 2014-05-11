
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


# Plot 1:  Make sure the numbers are numeric and generate a histogram sent to the png plotting device
par(mfrow = c(1, 1))
power$Global_active_power <-as.numeric(as.character(power$Global_active_power))

png(file = "plot1.png")
hist(power$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power") 
dev.off() 


