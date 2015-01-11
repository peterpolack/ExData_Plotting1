###Assumes working file 'household_power_consumption.txt' is present in the workding directory

plot2 <- function() {
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
  png(file = "plot2.png", bg = "white",width=480, height=480)
  plot(data$DateTime,data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
  dev.off()
}