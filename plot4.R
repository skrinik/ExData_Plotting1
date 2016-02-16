#SET WD AND FIND WHERE THE NECESSARY DATES BEGIN IN THE TEXT FILE
setwd("~/Documents/Docs/R Programming CourseEra/ExData_Plotting1")
con <- file("household_power_consumption.txt")
open(con)
grep("2/1/2007;", readLines(con)) #First line of 2007-02-01 dates is at 66636
close(con)

#READ IN THE DATA WE WILL USE ONLY
data <- read.table("household_power_consumption.txt", header = F, sep = ";", na.strings = "?", nrows = 2880, skip = 66637)
header <- read.table("household_power_consumption.txt",nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
colnames(data) <- unlist(header)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
x <- paste(data$Date, data$Time)
data$Time <- strptime(x, format = "%Y-%m-%d %H:%M:%S" )




#PLOTS:
png("plot4.png")
par(mfrow = c(2,2), mar = c(4,4,4,4))
#Plot 1
with(data, plot(Time, Global_active_power,type = "l", xlab = "", ylab = "Global Active Power"))

#Plot 2 
with(data, plot(Time, Voltage,type = "l", xlab = "datetime", ylab = "Voltage"))

#Plot 3
with(data, plot(Time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(data, lines(Time, Sub_metering_2, col="red"))
with(data, lines(Time, Sub_metering_3, col="blue"))
legend(x = "topright", lwd=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1:2, cex=0.8, box.lty=0)  

#Plot 4
with(data, plot(Time, Global_reactive_power,type = "l", xlab = "datetime", ylab = "Global_reactive_power"))

dev.off()






