

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
plot(sub$newCol,sub$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()