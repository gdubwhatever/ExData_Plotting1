##If you already downloaded and loaded the data into R you can jump to ##Making plot2

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
t<-paste(table$Date,rawtable$Time,sep=",")
datetime<-strptime(t,"%d/%m/%Y,%H:%M:%S")


#Making plot2
png(file="plot2.png")
plot(datetime,table$Global_active_power,type="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(datetime,table$Global_active_power)
dev.off()