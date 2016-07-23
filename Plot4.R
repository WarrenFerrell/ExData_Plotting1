requre(data.table, dplyr)

e_file <-"household_power_consumption.txt"
raw_data <- data.table::fread( e_file, sep = ";", na.strings = '?' )
energy_data <- filter(raw_data, Date == "1/2/2007" | Date == "2/2/2007" )
energy_data$Date <- dmy( energy_data$Date )
energy_data <- mutate( energy_data, instant = ymd_hms( paste(Date, Time) ) )



png( "plot4.png", width = 480, height = 480 )
par( mfcol = c(2,2) )
with( energy_data, plot( instant, Global_active_power, type = 'l',
                         ylab = "Global Active Power", xlab = "") )

with( energy_data, plot( instant, Sub_metering_1, type = 'n',
                         ylab = "Energy sub metering", xlab = "") )
with( energy_data, lines( instant, Sub_metering_1, type = 'l' ) )
with( energy_data, lines( instant, Sub_metering_2, type = 'l' , col = "red") )
with( energy_data, lines( instant, Sub_metering_3, type = 'l' , col = "blue") )
legend( "topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_2"),
        col = c("black", "red", "blue"), lty = 1 , bty = "n")

with( energy_data, plot( instant, Voltage, type = 'l',
                         ylab = "Voltage", xlab = "datetime") )

with( energy_data, plot( instant, Global_reactive_power, type = 'l',
                         ylab = "Global_reactive_power", xlab = "datetime") )



dev.off()