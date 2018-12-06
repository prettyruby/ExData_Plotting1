library(dplyr)

dat <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
#dat$rtime = strptime(paste(dat$Date,dat$Time), format = "%d/%m/%Y %H:%M:%S", tz = "UTC")
#dat_date$rtime <- as.POSIXct(dat_date$rtime)
#dat_subset <- filter(dat_date, rtime >= "2007-02-01" & rtime <= "2007-02-02")
dat$date_time = dmy_hms(paste(dat$Date, dat$Time))
dat_subset <- filter(dat, Date == "1/2/2007" | Date == "2/2/2007")

with(dat_subset, plot(date_time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

dev.copy(png, file = "plot2.png")
dev.off()

#By default, the graphs are 480x480 pixels in size, at a resolution of 72 dpi (6.66x6.66 inches).