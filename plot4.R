## my home country is Brazil, and R STudio is set to Portuguese
## i need to set it temporarily to English to generate week days in English
## Sys.getlocale("LC_TIME") => "Portuguese_Brazil.1252"

##
## > weekdays(Sys.Date()+0:6)
## [1] "sábado"        "domingo"       "segunda-feira" "terça-feira"  
## [5] "quarta-feira"  "quinta-feira"  "sexta-feira"  

## set to  to (US) English (English_United_States does not work, but C is fine)
Sys.setlocale("LC_TIME", "C")

# [1] "English_United States.1252"
## > weekdays(Sys.Date()+0:6)
## [1] "Saturday"  "Sunday"    "Monday"    "Tuesday"   "Wednesday" "Thursday" 
## [7] "Friday"   

## prepare screen to be a grid of graphs 2 graphs per row by 2 rows
par(mfrow=c(2,2), mar=c(2,4,2,2))

## 1-weekdays (need to be timestamp) X Global Active Power 
plot(power3$timestamp, power3$Global_active_power, type="l", xlab="", ylab="Global Active Power")
## 2-weekdays (need to be timestamp) X Voltage
plot(power3$timestamp, power3$Voltage, type="l", xlab="datetime", ylab="Voltage")

## 3-weekday (timestamp) X Energy sub meteting
## warning: before generating all four at once, need to resize the section where graphs are to be generated,
## near size 480 X 480, this is to avoid the legend  be truncated at right
plot(power3$timestamp,power3$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(power3$timestamp, power3$Sub_metering_2,col="red")
lines(power3$timestamp, power3$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), cex=.55, c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty=c(1,1), bty="y") 
# cex set size of the font

## weekday (timestamp) X Global 
plot(power3$timestamp, power3$Global_reactive_power, type="l", xlab="datetime", ylab="Global reactive power")

#generating archive and completing generation
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()


## set back to Portuguese
Sys.setlocale("LC_TIME","Portuguese_Brazil.1252")
## [1] "Portuguese_Brazil.1252"
## > weekdays(Sys.Date()+0:6)
## [1] "sábado"        "domingo"       "segunda-feira" "terça-feira"  
## [5] "quarta-feira"  "quinta-feira"  "sexta-feira" 
