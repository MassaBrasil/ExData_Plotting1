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

  
plot(power3$timestamp,power3$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(power3$timestamp,power3$Sub_metering_2,col="red")
lines(power3$timestamp,power3$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()


## set back to Portuguese
Sys.setlocale("LC_TIME","Portuguese_Brazil.1252")
## [1] "Portuguese_Brazil.1252"
## > weekdays(Sys.Date()+0:6)
## [1] "sábado"        "domingo"       "segunda-feira" "terça-feira"  
## [5] "quarta-feira"  "quinta-feira"  "sexta-feira" 
