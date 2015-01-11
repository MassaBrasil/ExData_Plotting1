## draw/plot the graph
hist(power3$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
## generate the archive, need to finish process to graph archive to be created
dev.copy(png, file="plot1.png", width=480, height=480)
## dev.off() creates the .png image file
dev.off()
