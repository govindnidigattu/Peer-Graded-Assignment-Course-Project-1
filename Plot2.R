
hpc <-read.table("D:\\coursera\\courses-master\\04_ExploratoryAnalysis\\household_power_consumption.txt",header=TRUE, 
                 sep=";", na.strings = "?")
hpc1 <-rbind(hpc[hpc$Date=="1/2/2007",],hpc[hpc$Date=="2/2/2007",])
hpc1$Date <- as.Date(hpc1$Date,"%d/%m/%Y")
hpc1<-cbind(hpc1, "DateTime" = as.POSIXct(paste(hpc1$Date, hpc1$Time)))

png("plot2.png", width=480, height=480)
plot(hpc1$Global_active_power ~ hpc1$DateTime, type="l", 
     xlab= "", ylab="Global Active power (kilowatts)")

## Save to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
