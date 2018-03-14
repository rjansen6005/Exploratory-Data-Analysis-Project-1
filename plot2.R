## Download the household power consumption data from UC irvine machine learning repository
## save the file in the project_1 folder
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","./project_1/household_power_consumption.zip")

## unzip the data
unzip("./project_1/household_power_consumption.zip", files = NULL,exdir = "./project_1",unzip = "internal")

## Delete the zip file to keep the project space clean
unlink("./project_1/household_power_consumption.zip")

## read the data into R 
## note the seperator in this file is a ";" not a comma
hh_power_consumption <- read.table("./project_1/household_power_consumption.txt",header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

## create a subset of data per the project requirements. The subset will inlcude data from 2007-02-01 and 2007-02-02

working_data <- hh_power_consumption[hh_power_consumption$Date %in% c("1/2/2007","2/2/2007") ,]

## convert the time and date columns to POSIX format
datetime_data <- strptime(paste(working_data$Date, working_data$Time, sep = " "),"%d/%m/%Y %H:%M:%S")

## to create a png set the device output to png and make the size 480x480
png("./project_1/plot2.png", width = 480,height = 480)

## Create the line graph
plot(datetime_data, as.numeric(working_data$Global_active_power),type = "l", xlab = "",ylab = "Global Active Power (kilowatts)")

## close the png device output to save the file and return output to screen
dev.off()
