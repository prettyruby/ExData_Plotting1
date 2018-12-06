library(dplyr)

dat <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
#dat$rtime = strptime(paste(dat$Date,dat$Time), format = "%d/%m/%Y %H:%M:%S", tz = "UTC")
#dat_date$rtime <- as.POSIXct(dat_date$rtime)
#dat_subset <- filter(dat_date, rtime >= "2007-02-01" & rtime <= "2007-02-02")
dat$date_time = dmy_hms(paste(dat$Date, dat$Time))
dat_subset <- filter(dat, Date == "1/2/2007" | Date == "2/2/2007")

png(file="plot4.png",width=480,height=480)

par(mfrow = c(2,2))

with(dat_subset, plot(date_time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

plot(dat_subset$date_time, dat_subset$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(dat_subset$date_time, dat_subset$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(dat_subset$date_time, dat_subset$Sub_metering_2, col = "red")
lines(dat_subset$date_time, dat_subset$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(dat_subset$date_time, dat_subset$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()