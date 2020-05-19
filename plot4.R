#Loading Libraries
library("dplyr")
library("tidyverse")
library("lubridate")

#Loading Data
getwd()

info <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )
head(info)
str(info)


#converting Date and time column type
info$datetime <- strptime(paste(info$Date, info$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

info <- info %>%
  mutate(Date = as.Date(dmy(Date))) 

#filtering data relevant to 2007-02-01 and 2007-02-02
subinfo <- subset(info, Date == ymd(20070201) | Date == ymd(20070202))

#plot4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(subinfo,{
  plot(subinfo$datetime,as.numeric(subinfo$Global_active_power),type="l",  xlab="",ylab="Global Active Power")  
  plot(subinfo$datetime,as.numeric(subinfo$Voltage), type="l",xlab="datetime",ylab="Voltage")
  plot(subinfo$datetime,subinfo$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(subinfo,lines(datetime,as.numeric(Sub_metering_1)))
  with(subinfo,lines(datetime,as.numeric(Sub_metering_2),col="red"))
  with(subinfo,lines(datetime,as.numeric(Sub_metering_3),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(subinfo$datetime,as.numeric(subinfo$Global_reactive_power),type="l",xlab="datetime",ylab="Global_reactive_power")
})


