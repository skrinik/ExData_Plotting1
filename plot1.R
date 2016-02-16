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

#PLOT
png("plot1.png")
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()


