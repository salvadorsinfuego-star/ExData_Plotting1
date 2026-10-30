# plot4.R
data_file <- "household_power_consumption.txt"
all_data <- read.table(data_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings="?")
sub_data <- subset(all_data, Date == "1/2/2007" | Date == "2/2/2007")

# Ihanda ang mga variables
datetime <- strptime(paste(sub_data$Date, sub_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(sub_data$Global_active_power)
globalReactivePower <- as.numeric(sub_data$Global_reactive_power)
voltage <- as.numeric(sub_data$Voltage)
subMetering1 <- as.numeric(sub_data$Sub_metering_1)
subMetering2 <- as.numeric(sub_data$Sub_metering_2)
subMetering3 <- as.numeric(sub_data$Sub_metering_3)

# Buksan ang PNG device
png("plot4.png", width=480, height=480)

# I-set ang layout sa 2 rows at 2 columns
par(mfrow = c(2, 2)) 

# Graph 1: Global Active Power
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")

# Graph 2: Voltage
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

# Graph 3: Energy sub metering
plot(datetime, subMetering1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"), bty="n")

# Graph 4: Global Reactive Power
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

# Isara ang device
dev.off()
