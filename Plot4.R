
png("plot3.png", width=485, height=485)
par(mfrow=c(2,2))
plot(hpc1$Global_active_power ~ hpc1$DateTime, type="l")
plot(hpc1$Voltage ~ hpc1$DateTime, type="l")

with(hpc1, {plot(Sub_metering_1 ~ DateTime, type="l")})
lines(hpc1$Sub_metering_2 ~ hpc1$DateTime, col = 'Red')
lines(hpc1$Sub_metering_3 ~ hpc1$DateTime, col = 'Blue')

plot(hpc1$Global_reactive_power ~ hpc1$DateTime, type="l")
dev.off()