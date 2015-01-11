###Assumes working file 'household_power_consumption.txt' is present in the workding directory

plot4 <- function() {
  ###Reads the working file in and assigns the appropriate subset to the data variable 
  x<-read.csv("household_power_consumption.txt",sep=";", stringsAsFactor=FALSE)
  data = subset(x, x$Date %in% c("1/2/2007", "2/2/2007"))
  
  ###Makes appropriate values in the dataframe numeric data
  data$Global_active_power<-as.numeric(as.character(data$Global_active_power))
  data$Global_reactive_power<-as.numeric(as.character(data$Global_reactive_power))
  data$Voltage<-as.numeric(as.character(data$Voltage))
  data$Sub_metering_1<-as.numeric(as.character(data$Sub_metering_1))
  data$Sub_metering_2<-as.numeric(as.character(data$Sub_metering_2))
  data$Sub_metering_3<-as.numeric(as.character(data$Sub_metering_3))
  
  ###Creates a DateTime variable and converts it to DateTime data
  data$DateTime<-paste(data$Date, data$Time, sep=" ")
  data$DateTime<-strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")
  
  ###Opens appropriate png file and plots to the png file, then closes the png file
  png(file = "plot4.png", bg = "white",width=480, height=480)
  par(mfcol = c(2, 2))
  with(data, {
    plot(data$DateTime,data$Global_active_power,type="l",xlab="",ylab="Global Active Power")
    plot(data$DateTime,data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
    lines(data$DateTime,data$Sub_metering_2,col="red")
    lines(data$DateTime,data$Sub_metering_3,col="blue")
    legend("topright", lty = 1, col = c("black","blue", "red"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),box.col="transparent",inset=.002)
    plot(data$DateTime,data$Voltage,type="l",xlab="datetime",ylab="Voltage")
    plot(data$DateTime,data$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
    
  })
  dev.off()
}