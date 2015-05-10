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
  filename = "plot4.png"
) 

par(mfrow = c(2, 2))

# plot i
plot (
  df$DateTime,
  df$Global_active_power, 
  type = "l",
  xlab = "",
  ylab = "Global Active Power"
)

# plot ii
plot (
  df$DateTime,
  df$Voltage, 
  type = "l",
  xlab = "datetime",
  ylab = "Voltage"
)

# plot iii
plot (
  df$DateTime,
  df$Sub_metering_1, 
  type = "l",
  xlab = "",
  ylab = "Energy Sub Metering"
)

lines (
  df$DateTime,
  df$Sub_metering_2, 
  col = "red"
)

lines (
  df$DateTime,
  df$Sub_metering_3, 
  col = "blue"
)

# legend
legend (
  "topright", 
  legend = paste("Sub_metering", c(1:3), sep = "_"), 
  col = c("black", "red", "blue"), 
  lwd = 1, 
  bty = "n"
)

# plot iv
plot (
  df$DateTime,
  df$Global_reactive_power, 
  type = "l",
  xlab = "datetime",
  ylab = "Global_reactive_power"
)

par(mfrow = c(1, 1))

# close device
dev.off (
)