
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
mydata <- na.omit(mydata)


subdata <- mydata[(mydata$DateTime>="2007-02-01 00:00:00")&(mydata$DateTime<="2007-02-03 00:00:00"),]
dim(subdata)
head(subdata)
sum(is.na(subdata))
subdata <- na.omit(subdata)

png(filename="plot1.png")
hist(subdata$Global_active_power,
      xlab="Global active power",
      ylab="Frequency",
      col="red",
      main="Global active power")
dev.off()

png(filename="plot2.png")
nts <- length(subdata$DateTime)
GAP.ts <- ts(subdata$Global_active_power,
              start=subdata$DateTime[1],
              end=subdata$DateTime)
xlabls[subdata$Time == "00:00:00"] <- c("Thu","Fri")
plot(subdata$DateTime,subdata$Global_active_power,
     ylab="Global active power", 
     xlab="Time",
     col="red")
dev.off()
