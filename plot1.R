# plot1.R
# Siguraduhing nandoon ang "household_power_consumption.txt" sa directory

# Magbasa ng data at i-filter agad para sa Feb 1 at 2, 2007
data_file <- "household_power_consumption.txt"
all_data <- read.table(data_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings="?")
sub_data <- subset(all_data, Date == "1/2/2007" | Date == "2/2/2007")

# Convert sa numeric
globalActivePower <- as.numeric(sub_data$Global_active_power)

# Buksan ang PNG device
png("plot1.png", width=480, height=480)

# Gumawa ng histogram
hist(globalActivePower, 
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

# Isara ang device
dev.off()

