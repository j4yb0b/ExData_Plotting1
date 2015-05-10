# read data from unzipped file
df <- read.table (
  file = "household_power_consumption.txt", 
  header = TRUE, 
  sep = ";", 
  na.strings = "?",
  stringsAsFactors = FALSE
)

# subset data
df <- df[df$Date %in% c("1/2/2007", "2/2/2007"), ]

# edit date variable
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df$DateTime <- as.POSIXct(paste(df$Date, df$Time))

# plot
png(
  filename = "plot3.png"
) 

plot (
  df$DateTime,
  df$Sub_metering_1, 
  type = "l",
  xlab = "",
  ylab = "Energy Sub Metering"
)

lines(
  df$DateTime,
  df$Sub_metering_2, 
  col = "red"
)

lines(
  df$DateTime,
  df$Sub_metering_3, 
  col = "blue"
)

# legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1)

# close device
dev.off (
)