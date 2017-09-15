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

plot(sub$newCol,sub$Sub_metering_1, type="n", col = "black", ylab="Energy sub metering", xlab="")
points(sub$newCol,sub$Sub_metering_1, type = "s", col="black")
points(sub$newCol,sub$Sub_metering_2, type = "s", col="red")
points(sub$newCol,sub$Sub_metering_3, type = "s", col="blue")
legend("topright" , lty=1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

dev.off()