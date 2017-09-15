## set urlF to the location where the data file is present
hhPowerD <- read.table(urlF,header = TRUE,sep = ";", na.strings = "?")
## subset the data for the given days
sub <- hhPowerD[(hhPowerD$Date == "1/2/2007" | hhPowerD$Date == "2/2/2007" ), ]

## For faster rendering combining the date and time columns to one and add it as a new column - not right approach to duplicate for whole 2MM records
newCol <- paste(sub$Date,sub$Time)
sub <- transform(sub, newCol = strptime(newCol,"%Y-%m-%d %H:%M:%S"))

# set relURL to the location of the file
png(relUrl,width = 480, height = 480)

## set the margin accordingly to display the graph unshrunk. Note reducing margin will scale up the measures in Yaxis specifically
par(mar=c(5,5,1,4))

## set a 2 by 2 layout
par(mfrow=c(2,2), mar = c(4,4,2,1), oma = c(1,2,1,1))


plot(sub$newCol,sub$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(sub$newCol,sub$Voltage, xlab="datetime", ylab="Voltage",type ="l")
plot(sub$newCol,sub$Sub_metering_1, type="n", col = "black", ylab="Energy sub metering", xlab="")
points(sub$newCol,sub$Sub_metering_1, type = "s", col="black")
points(sub$newCol,sub$Sub_metering_2, type = "s", col="red")
points(sub$newCol,sub$Sub_metering_3, type = "s", col="blue")

## make sure cex is set to proportinately resize the legend
legend("toprigh" , bty = "n", cex = .75, lty=1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

plot(sub$newCol,sub$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power",type ="l")


dev.off()
