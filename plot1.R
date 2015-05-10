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

# plot
png (
  filename = "plot1.png"
) 

hist (
  x = df$Global_active_power, 
  col = "red", 
  xlab = "Global Active Power (kilowatts)", 
  main = "Global Active Power"
)

# close device
dev.off (
)