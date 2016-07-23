requre(data.table, dplyr)

e_file <-"household_power_consumption.txt"
raw_data <- data.table::fread( e_file, sep = ";", na.strings = '?' )
energy_data <- filter(raw_data, Date == "1/2/2007" | Date == "2/2/2007" )
energy_data$Date <- dmy( energy_data$Date )
energy_data <- mutate( energy_data, instant = ymd_hms( paste(Date, Time) ) )



png( "plot2.png", width = 480, height = 480 )

with( energy_data, plot( instant, Global_active_power, type = 'l',
    ylab = "Global Active Power (kilowatts)", xlab = "") )

dev.off()