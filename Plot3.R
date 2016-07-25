hpc <-read.table("D:\\coursera\\courses-master\\04_ExploratoryAnalysis\\household_power_consumption.txt",header=TRUE, 
                 sep=";", na.strings = "?")
hpc1 <-rbind(hpc[hpc$Date=="1/2/2007",],hpc[hpc$Date=="2/2/2007",])
hpc1$Date <- as.Date(hpc1$Date,"%d/%m/%Y")
hpc1<-cbind(hpc1, "DateTime" = as.POSIXct(paste(hpc1$Date, hpc1$Time)))

png("plot3.png", width=480, height=480)
with(hpc1, {plot(Sub_metering_1 ~ DateTime, type="l", xlab= "", 
                 ylab="Energy Sub Metering")})

lines(hpc1$Sub_metering_2 ~ hpc1$DateTime, col = 'Red')
lines(hpc1$Sub_metering_3 ~ hpc1$DateTime, col = 'Blue')
legend("topright",lty=1,lwd =3,col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## Save to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
