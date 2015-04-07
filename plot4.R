setwd('C:\\Users\\Lingqian\\Documents\\R\\exploratory\\ExData_Plotting1')
##1. read full data
data=read.csv('household_power_consumption.txt',header=TRUE,sep=';',na.strings='?')
dim(data)  ##2075259 9
##2. convert date
date=as.Date(data$Date,'%d/%m/%Y')
data$Date=date
##3. get data we need
DATA=subset(data,c(Date=='2007-02-01'|Date=='2007-02-02'))
dim(DATA)  ##2880 9
DATA$DateTime=paste(DATA$Date,DATA$Time)
DATA$DateTime=strptime(DATA$DateTime,"%Y-%m-%d %H:%M:%S")

##4.plot
head(DATA)
png('plot4.png',width=480,height=480)
par(mfrow=c(2,2))
with(DATA,plot(DATA$DateTime,DATA$Global_active_power,type='l',xlab='',
     ylab='Global Active Power'))
with(DATA,plot(DATA$DateTime,DATA$Voltage,type='l',xlab='datetime',
     ylab='Voltage'))
with(DATA,plot(DATA$DateTime,DATA$Sub_metering_1,type='l',xlab='',
     ylab='Energy sub metering',col='black'))
with(DATA,lines(DATA$DateTime,DATA$Sub_metering_2,col='red'))
with(DATA,lines(DATA$DateTime,DATA$Sub_metering_3,col='blue'))
legend('topright',lwd=1,col=c('black','red','blue'),
        legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
with(DATA,plot(DATA$DateTime,DATA$Global_active_power,type='l',xlab='',
     ylab='Global_reactive_power'))
dev.off()



