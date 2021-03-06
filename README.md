# Peer-Graded-Assignment-Course-Project-1
Exploratory analysis 1
---
title: "Course Project 1- Exploratory Analysis"
author: "Dr.Govind Nidigattu"
date: "July 22, 2016"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

The dataset has 2,075,259 observations and 9 variables.The dataset are taken from the UCI web site.https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption#. Variables description is given below.

 1.Date: Date in format dd/mm/yyyy
 
 2.Time: time in format hh:mm:ss
 
 3.Global_active_power: household global minute-averaged active power (in kilowatt)
 
 4.Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
 
 5.Voltage: minute-averaged voltage (in volt)
 
 6.Global_intensity: household global minute-averaged current intensity (in ampere)
 
 7.Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen,      containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
 
 8.Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry       room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
 
 9.Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric       water-heater and an air-conditioner.
 
 
 
```{r}
hpc <-read.table("D:\\coursera\\courses-master\\04_ExploratoryAnalysis\\household_power_consumption.txt",header=TRUE, sep=";", na.strings = "?")
hpc1 <-rbind(hpc[hpc$Date=="1/2/2007",],hpc[hpc$Date=="2/2/2007",])
```

The objective of this exploratory analysis is find patterns in data,understand its properties and suggest modeling strategies further to eliminate unwanted paterns in the data.

**Goal**

Goal and objective here is simply to examine, how household energy usage varies over a 2-day period in February, 2007.Producing the plots using the base plotting system.

** Transformation of Date and Time into a DateTime format**

```{r}
hpc1$Date <- as.Date(hpc1$Date,"%d/%m/%Y")
hpc1<-cbind(hpc1, "DateTime" = as.POSIXct(paste(hpc1$Date, hpc1$Time)))
```


**Plotting a plot 1**

```{r}
hist(as.numeric(hpc1$Global_active_power), col="Red", main="Global Active Power", xlab="Global Active power (kilowatts)", ylab="Frequency")
```

**Plotting a plot 2**

```{r}
plot(hpc1$Global_active_power ~ hpc1$DateTime, type="l", xlab= "", ylab="Global Active power (kilowatts)")
```

**Plotting a plot 3**

```{r}
with(hpc1, {plot(Sub_metering_1 ~ DateTime, type="l", xlab= "", ylab="Energy Sub Metering")})

lines(hpc1$Sub_metering_2 ~ hpc1$DateTime, col = 'Red')
lines(hpc1$Sub_metering_3 ~ hpc1$DateTime, col = 'Blue')
legend("topright",lty=1,lwd =3,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
```

**Plotting a plot 4**

```{r}
par(mfrow=c(2,2))
plot(hpc1$Global_active_power ~ hpc1$DateTime, type="l")
plot(hpc1$Voltage ~ hpc1$DateTime, type="l")

with(hpc1, {plot(Sub_metering_1 ~ DateTime, type="l")})
lines(hpc1$Sub_metering_2 ~ hpc1$DateTime, col = 'Red')
lines(hpc1$Sub_metering_3 ~ hpc1$DateTime, col = 'Blue')

plot(hpc1$Global_reactive_power ~ hpc1$DateTime, type="l")
```
