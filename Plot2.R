
mydata <- read.table("hp_cons.txt",sep=";",header=TRUE)
mydata$Time <- as.character(mydata$Time)
mydata$Date <- as.character(mydata$Date)
mydata[mydata=="?"] <- NA
mydata[mydata=="NA"] <- NA
dim(mydata)
head(mydata)
mydata <- na.omit(mydata)
mydata$DateTime <- paste(mydata$Date,mydata$Time,sep=" ")

mydata$DateTime <- strptime(mydata$DateTime,"%d/%m/%Y %H:%M:%S")

mydata$Global_active_power <- as.numeric( as.character(mydata$Global_active_power) )
mydata$Global_reactive_power <- as.numeric( as.character(mydata$Global_reactive_power) )
mydata$Sub_metering_1 <- as.numeric( as.character(mydata$Sub_metering_1) )
mydata$Sub_metering_2 <- as.numeric( as.character(mydata$Sub_metering_2) )
mydata$Sub_metering_3 <- as.numeric( as.character(mydata$Sub_metering_3) )
mydata$Voltage <- as.numeric( as.character(mydata$Voltage) )
mydata <- na.omit(mydata)


subdata <- mydata[(mydata$DateTime>="2007-02-01 00:00:00")&(mydata$DateTime<="2007-02-03 00:00:00"),]
dim(subdata)
head(subdata)
sum(is.na(subdata))
subdata <- na.omit(subdata)


png(filename="plot2.png",width = 480, height = 480)
# labels - weekdays are in LATVIAN ce=Thu, pk=Fri, se=Sat, YO-HO-HO
plot(subdata$DateTime,
     subdata$Global_active_power,
     ylab="Global active power", 
     xlab="Time",
     col="red",
     type="l")
dev.off()
