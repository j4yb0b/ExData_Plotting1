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
  filename = "plot3.png"
) 

with (
  data = df,
  expr = {
    plot (
      x = datetime,
      y = Sub_metering_1, 
      type = "l",
      xlab = "",
      ylab = "Energy Sub Metering"
    )
  
    lines (
      x = datetime,
      y = Sub_metering_2,
      col = "red"
    )
    
    lines (
      x = datetime,
      y = Sub_metering_3,
      col = "blue"
    )
    
    legend (
      x = "topright", 
      legend = paste("Sub_metering", 1:3, sep = "_"), 
      col = c("black", "red", "blue"), 
      lty = 1
    )
  }
)

# close device
dev.off ()