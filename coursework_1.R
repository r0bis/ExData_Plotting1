# coursework 1
setwd("~/Documents/Tech/Coursera/exploratory/ExData_Plotting1/")
# list.files("../data/")
dfilename <- '' # assign filename variable
# test if the data file is in the right place
if(file.exists("../data/household_power_consumption.txt")) {
  dfilename <- "../data/household_power_consumption.txt"
} else {
  if(file.exists("./household_power_consumption.txt")) {
    dfilename <- "./household_power_consumption.txt" 
  } else {
  stop("Data file not found, check readme paragraph 1")
  }
}
# load sqldf for fast reading and subsetting of the data file
# load lubridate for easy date/time conversion
library(sqldf)
library(lubridate)
# read the data  - you should get 2880 rows in this case (equals to number of
# minutes in 2 days)
dt1 <- read.csv.sql(dfilename,sql="SELECT * FROM file WHERE Date IN ('1/2/2007','2/2/2007')",sep=";")
closeAllConnections()
# check if we have to deal with NA values in the data we have read, in fact this
# is not the case, but checking may be useful with other data
if(isTRUE(rowSums(dt1=="?") >0)) { 
  stop("There are ? marks in data - please convert to NA, or think how you will deal with NAs ;)")
}

# process the date and time values in date
dt1$dateTime <- paste(dt1$Date,dt1$Time)
dt1$dateTime <- as.character(dt1$dateTime)
dt1$dateTime <- dmy_hms(dt1$dateTime)
# now we have a dateTime field with correct points in time

# plot 1 histogram global active power kilowatts
png(file="plot1.png",width=480,height=480)
with(dt1,hist(Global_active_power,col=c("red"),main="Global Active Power",xlab="Global Active Power (kilowatts)"))
dev.off()


# plot 2 global active power kilowatts
png(file="plot2.png",width=480,height=480)
with(dt1,plot(dateTime,Global_active_power,type='l',xlab="",ylab="Global Active Power (kilowatts)"))
dev.off()

# plot 3 sub metering:
png(file="plot3.png",width=480,height=480)
with(dt1,plot(dateTime,Sub_metering_1,type='l',col="black",ylab="Energy sub metering",xlab=""))
with(dt1,lines(dateTime,Sub_metering_2,col="red"))
with(dt1,lines(dateTime,Sub_metering_3,col="blue"))
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,cex=1.2)
dev.off()

# plot 4  fourby four : fill by rows (2x2 cells)
# important that you open device first then set mfrow
png(file="plot4.png",width=480,height=480)
par(mfrow=c(2,2))
# subplot 1 GAP
with(dt1,plot(dateTime,Global_active_power,type='l',xlab="",ylab="Global Active Power (kilowatts)"))
# subplot 2 Voltage
with(dt1,plot(dateTime,Voltage,type='l'))
# subplot 3 Energy sub metering
with(dt1,plot(dateTime,Sub_metering_1,type='l',col="black",ylab="Energy sub metering",xlab=""))
with(dt1,lines(dateTime,Sub_metering_2,col="red"))
with(dt1,lines(dateTime,Sub_metering_3,col="blue"))
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,cex=0.8)
# subplot 4 GRP
with(dt1,plot(dateTime,Global_reactive_power,type='l'))
# wrap up the work 
dev.off()

