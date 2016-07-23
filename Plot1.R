requre(data.table, dplyr)

e_file <-"household_power_consumption.txt"
raw_data <- data.table::fread( e_file, sep = ";", na.strings = '?' )
energy_data <- filter(raw_data, Date == "1/2/2007" | Date == "2/2/2007" )
energy_data$Date <- dmy( energy_data$Date )
energy_data <- mutate( energy_data, instant = ymd_hms( paste(Date, Time) ) )


png( "plot1.png", width = 480, height = 480 )

hist(energy_data$Global_active_power, col = c("red"), xlim = c(0,6), ylim = c(0, 1200),
     xlab = "Global Active Power (kilowatts)", axes = FALSE, main = "Global Active Power")
axis(1, seq( 0, 6, 2) )
axis(2, seq( 0, 1200, 200) )

dev.off()