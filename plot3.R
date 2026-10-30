# plot3.R
data_file <- "household_power_consumption.txt"
all_data <- read.table(data_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings="?")
sub_data <- subset(all_data, Date == "1/2/2007" | Date == "2/2/2007")

# Pagsamahin ang Date at Time at i-convert ang sub-meterings
datetime <- strptime(paste(sub_data$Date, sub_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subMetering1 <- as.numeric(sub_data$Sub_metering_1)
subMetering2 <- as.numeric(sub_data$Sub_metering_2)
subMetering3 <- as.numeric(sub_data$Sub_metering_3)

# Buksan ang PNG device
png("plot3.png", width=480, height=480)

# I-plot ang unang sub-metering
plot(datetime, subMetering1, type="l", xlab="", ylab="Energy sub metering")

# Idagdag ang pangalawa at pangatlong linya
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")

# Idagdag ang Legend sa kanang itaas
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, 
       col=c("black", "red", "blue"))

# Isara ang device
dev.off()
