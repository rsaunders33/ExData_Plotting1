#Read Data (File must be in same directory as R file)
hpcData <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

#Subset data for dates we want to analyze
hpcData <- subset(hpcData, Date=="1/2/2007" | Date=="2/2/2007")

#Convert Date to date type
hpcData$Date <- as.Date(hpcData$Date, "%d/%m/%Y")

#Combine Date and Time and Convert to Date/Time Format
hpcData$Date_Time <- paste(hpcData$Date,hpcData$Time)
hpcData$Date_Time <- as.POSIXlt(strptime(hpcData$Date_Time,"%Y-%m-%d %H:%M:%S"))

#Convert Metrics to Numeric values                           
hpcData[,3:9]<-lapply(hpcData[,3:9], function(x){as.numeric(as.character(x))})

#Plot 2
png(file = "plot2.png",width = 480, height = 480)
par(mfrow=c(1,1),mar=c(5,4,2,1), cex=1)
plot(hpcData$Date_Time,hpcData$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)", type="l")
dev.off()