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

#plot2 
plot(subinfo$datetime, as.numeric(subinfo$Global_active_power), type = "l", xlab = "Day", ylab = "Global Active Power (kilowatts)")
title(main="Global Active Power Vs Time")
