
mydirectory <- "C://Users//hiramatm"
setwd(mydirectory)
## set my working directory

download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","zipp.zip")
file <- unzip("zipp.zip")
## download and unzip archive

power <- read.table(file, header=T, sep=";")
## load unzipped archive
power2 <- power
## create a copy before changing variable
power2$Date <- as.Date(power$Date, format="%d/%m/%Y")
## convert variable Date to class Date
dates <- seq(as.Date("2007-02-01"), as.Date("2007-02-02"), by = "day")
## create Date variable 'dates' to select days 1 and 2 of febr 2007

power3 <- power2[ power2$Date == dates, ]
## select rows correspondent to dates 2007-02-01 and 2007-02-02

## nrow(power3)
## this command helps to check how many rows in object

## unique(power3$Date)
## list distinct dates to check that both dates are selected.

## the variables need to be converted to numeric
## they are of class factor, and cannt be used 
power3$Global_active_power <- as.numeric(as.character(power3$Global_active_power))
power3$Global_reactive_power <- as.numeric(as.character(power3$Global_reactive_power))
power3$Voltage <- as.numeric(as.character(power3$Voltage))
power3$Sub_metering_1 <- as.numeric(as.character(power3$Sub_metering_1))
power3$Sub_metering_2 <- as.numeric(as.character(power3$Sub_metering_2))
power3$Sub_metering_3 <- as.numeric(as.character(power3$Sub_metering_3))
## add variable timestamp
power3 <- transform(power3, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
