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

# plot
png (
  filename = "plot1.png"
) 

with (
  data = df, 
  expr = hist (
    Global_active_power,
    xlab = "Global Active Power (kilowatts)",
    col = "red",
    main = "Global Active Power"
  )
)

# close device
dev.off ()