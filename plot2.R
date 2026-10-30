# plot2.R
data_file <- "household_power_consumption.txt"
all_data <- read.table(data_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings="?")
sub_data <- subset(all_data, Date == "1/2/2007" | Date == "2/2/2007")

# Pagsamahin ang Date at Time para sa tamang timeline
datetime <- strptime(paste(sub_data$Date, sub_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(sub_data$Global_active_power)

# Buksan ang PNG device
png("plot2.png", width=480, height=480)

# Gumawa ng line plot (type="l")
plot(datetime, globalActivePower, 
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")

# Isara ang device
dev.off()
