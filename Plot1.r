


hist(as.numeric(hpc1$Global_active_power), col="Red", 
     main="Global Active Power", 
     xlab="Global Active power (kilowatts)", ylab="Frequency")
png("plot1.png", width=485, height=485)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()