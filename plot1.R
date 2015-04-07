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
png('plot1.png',width=480,height=480)
hist(DATA$Global_active_power,main='Global Active Power',
     xlab='Global Active Power(killowatts)',ylab='Frequency',col='Red')
dev.off()