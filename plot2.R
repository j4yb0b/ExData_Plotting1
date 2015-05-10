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
  filename = "plot2.png"
) 

plot (
  df$DateTime,
  df$Global_active_power, 
  type = "l", 
  xlab = "",
  ylab = "Global Active Power (kilowatts)"
)

# close device
dev.off (
)