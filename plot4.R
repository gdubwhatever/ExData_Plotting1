##If you already downloaded and loaded the data into R you can jump to ##Making plot4

##Download a data file and extract
##The original URL address is "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" 
##but I changed https to http to avoid error(download had nonzero exit status).
url<-"http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile="household_power_consumption.zip", method="internal")
unzip("household_power_consumption.zip")

##Load data for 2007-02-01 and 2007-02-02 as data.frame 
header<-names(read.table("household_power_consumption.txt",sep=";", header=TRUE, nrows=1))
table<-read.table("household_power_consumption.txt", sep=";", skip=66637, nrows=2880, na.strings="?",stringsAsFactors=FALSE)
names(table)<-header

##Set language as English  in order to print weekdays as English
Sys.setlocale("LC_TIME", "en_US.UTF-8")

##Paste Date and Time Columns and make it as Date/Time class vector
t<-paste(table$Date,table$Time,sep=",")
datetime<-strptime(t,"%d/%m/%Y,%H:%M:%S")


##Making plot4
png(file="plot4.png")
par(mfcol=c(2,2))

##top left graph
plot(datetime,table$Global_active_power,type="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(datetime,table$Global_active_power)

##bottom left graph
plot(datetime,table$Sub_metering_1,pch=".", xlab="", ylab="Energy sub metering")
lines(datetime,table$Sub_metering_1)
points(datetime,table$Sub_metering_2,pch=".",col="red")
lines(datetime,table$Sub_metering_2,col="red")
points(datetime,table$Sub_metering_3,pch=".",col="blue")
lines(datetime,table$Sub_metering_3,col="blue")
legend("topright", pch="_", border="white",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

##top right graph
plot(datetime,table$Voltage,type="n", ylab="Voltage")
lines(datetime,table$Voltage)

##bottom right graph
plot(datetime,table$Global_reactive_power,type="n", ylab="Global_reactive_power")
lines(datetime,table$Global_reactive_power)

dev.off()