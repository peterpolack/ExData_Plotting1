

x<-read.csv("household_power_consumption.txt",sep=";")

x<-read.csv("household_power_consumption.txt",sep=";", stringsAsFactor=FALSE)
data = subset(x, x$Date %in% c("2/1/2007", "2/2/2007"))


hist(as.numeric(as.character(data$Global_active_power)))


hist(as.numeric(as.character(data$Global_active_power)),main="Global Active Power", col="red")

hist(as.numeric(as.character(data$Global_active_power)),main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")

hist(as.numeric(as.character(data$Global_active_power)),main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)", xlim=c(0,6), ylim=c(0,1200))

#########################################
PLOT1
#########################################
data = subset(x, x$Date %in% c("1/2/2007", "2/2/2007"))
hist(as.numeric(as.character(data$Global_active_power)),main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
dev.copy(png,file="plot1.png")

png(file = "plot1.png", bg = "transparent",width=480, height=480)
hist(as.numeric(as.character(data$Global_active_power)),main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
dev.off()
##############################################
##############################################
##############################################

#########################################
PLOT2
#########################################
data$DateTime<-paste(data$Date, data$Time, sep=" ")
plot(strptime(data$DateTime, "%d/%m/%Y %H:%M:%S"),as.numeric(as.character(data$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.copy(png,file="plot2.png")
dev.off()

########################
x<-read.csv("household_power_consumption.txt",sep=";", stringsAsFactor=FALSE)
data = subset(x, x$Date %in% c("1/2/2007", "2/2/2007"))

data$Global_active_power<-as.numeric(as.character(data$Global_active_power))
data$Global_reactive_power<-as.numeric(as.character(data$Global_reactive_power))
data$Voltage<-as.numeric(as.character(data$Voltage))
data$Sub_metering_1<-as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2<-as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3<-as.numeric(as.character(data$Sub_metering_3))


data$DateTime<-paste(data$Date, data$Time, sep=" ")
data$DateTime<-strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

png(file = "plot2.png", bg = "transparent",width=480, height=480)
plot(data$DateTime,data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()

######################################### 

#########################################
PLOT3
#########################################
plot(strptime(data$DateTime, "%d/%m/%Y %H:%M:%S"),as.numeric(as.character(data$Sub_metering_1)),type="l",xlab="",ylab="Energy sub metering")
with(points(strptime(data$DateTime, "%d/%m/%Y %H:%M:%S"),as.numeric(as.character(data$Sub_metering_2)),col="red"))
with(points(strptime(data$DateTime, "%d/%m/%Y %H:%M:%S"),as.numeric(as.character(data$Sub_metering_3)),col="blue"))

plot(strptime(data$DateTime, "%d/%m/%Y %H:%M:%S"),as.numeric(as.character(data$Sub_metering_1)),type="l",xlab="",ylab="Energy sub metering")
lines(strptime(data$DateTime, "%d/%m/%Y %H:%M:%S"),as.numeric(as.character(data$Sub_metering_2)),col="red")
lines(strptime(data$DateTime, "%d/%m/%Y %H:%M:%S"),as.numeric(as.character(data$Sub_metering_3)),col="blue")
legend("topright", lty = 1, col = c("black","blue", "red"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

#########################################
PLOT4
#########################################
par(mfcol = c(2, 2))
with(data, {
  plot(strptime(data$DateTime, "%d/%m/%Y %H:%M:%S"),as.numeric(as.character(data$Global_active_power)),type="l",xlab="",ylab="Global Active Power")
  plot(strptime(data$DateTime, "%d/%m/%Y %H:%M:%S"),as.numeric(as.character(data$Sub_metering_1)),type="l",xlab="",ylab="Energy sub metering")
  lines(strptime(data$DateTime, "%d/%m/%Y %H:%M:%S"),as.numeric(as.character(data$Sub_metering_2)),col="red")
  lines(strptime(data$DateTime, "%d/%m/%Y %H:%M:%S"),as.numeric(as.character(data$Sub_metering_3)),col="blue")
  legend("topright", lty = 1, col = c("black","blue", "red"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),box.col="transparent",inset=.002)
  plot(strptime(data$DateTime, "%d/%m/%Y %H:%M:%S"),as.numeric(as.character(data$Voltage)),type="l",xlab="datetime",ylab="Voltage")
  plot(strptime(data$DateTime, "%d/%m/%Y %H:%M:%S"),as.numeric(as.character(data$Global_reactive_power)),type="l",xlab="datetime",ylab="Global reactive power")
  
})