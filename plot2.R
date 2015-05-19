# read data from unzipped file
df <- read.table (
  file = "household_power_consumption.txt", 
  header = TRUE, 
  sep = ";", 
  na.strings = "?",
  stringsAsFactors = FALSE
)

# subset data
df <- subset (
  x = df, 
  subset = Date %in% c("1/2/2007", "2/2/2007")
)

# edit date variable
df$Date <- as.Date (
  x = df$Date, 
  format = "%d/%m/%Y"
)

df$datetime <- as.POSIXct (
  x = paste(df$Date, df$Time)
)

# plot
png (
  filename = "plot2.png"
) 

with (
  data = df,
  expr = plot (
    x = datetime,
    y = Global_active_power, 
    type = "l", 
    xlab = "",
    ylab = "Global Active Power (kilowatts)"
  )
)

# close device
dev.off ()