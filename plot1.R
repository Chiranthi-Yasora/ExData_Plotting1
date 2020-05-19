#Loading Libraries
library("dplyr")
library("tidyverse")
library("lubridate")
install.packages("naniar")
library(naniar)

#Loading Data
getwd()

info <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )
head(info)
str(info)


#converting Date and time column type
info <- info %>%
  mutate(Date = as.Date(dmy(Date))) 

  mutate(Time = format(Time, format = "%H:%M:%S"))


#filtering data relevant to 2007-02-01 and 2007-02-02
subinfo <- info %>%
  filter(Date == ymd(20070201) | Date == ymd(20070202))

str(subinfo)  

#drawing the plot
hist(as.numeric(subinfo$Global_active_power),col="red",main="Global Active Power",
     xlab="Global Active Power(kilowatts)")



