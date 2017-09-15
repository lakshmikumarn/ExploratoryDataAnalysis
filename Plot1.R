
## set urlF to the location where the data file is present
hhPowerD <- read.table(urlF,header = TRUE,sep = ";", na.strings = "?")
## subset the data for the given days
sub <- hhPowerD[(hhPowerD$Date == "1/2/2007" | hhPowerD$Date == "2/2/2007" ), ]

# set relURL to the location of the file
png(relUrl,width = 480, height = 480)

## set the margin accordingly to display the graph unshrunk. Note reducing margin will scale up the measures in Yaxis specifically

par(mar=c(5,5,1,1))
hist(sub$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main = " Global Active Power")
dev.off()