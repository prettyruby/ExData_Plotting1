library(dplyr)

dat <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
#dat$rtime = strptime(paste(dat$Date,dat$Time), format = "%d/%m/%Y %H:%M:%S", tz = "UTC")
#dat_date$rtime <- as.POSIXct(dat_date$rtime)
#dat_subset <- filter(dat_date, rtime >= "2007-02-01" & rtime <= "2007-02-02")
dat$date_time = dmy_hms(paste(dat$Date, dat$Time))
dat_subset <- filter(dat, Date == "1/2/2007" | Date == "2/2/2007")
dat_subset$Global_active_power <- as.numeric(as.character(dat_subset$Global_active_power))
hist(dat_subset$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", xlim = c(0,6), xaxt = "n", breaks = 13)
axis(side=1, at=c(0,2,4,6))

dev.copy(png, file = "plot1.png")
dev.off()
#By default, the graphs are 480x480 pixels in size, at a resolution of 72 dpi (6.66x6.66 inches).