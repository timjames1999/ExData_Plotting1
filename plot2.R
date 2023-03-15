library(plyr)

# Check for existing file, then download the data
setwd("C:/Users/tobin/Documents/GitHub")
if(!file.exists("./ExData_Plotting1")){dir.create("./ExData_Plotting1")}
file_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(file_url, destfile = "./ExData_Plotting1/projectdataset.zip")

# Unzip file
unzip(zipfile = "./ExData_Plotting1/projectdataset.zip", exdir = "./ExData_Plotting1")

#Read household power data
hpower <- read.table("./ExData_Plotting1/household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?")

#Subset the data for dates needed
subsetdata <- hpower[hpower$Date %in% c("1/2/2007","2/2/2007") ,]

#Convert time to usable x-axis
date_conv <- as.Date(subsetdata[, 1], format = "%d/%m/%Y")
time_conv <- strptime(subsetdata[, 2], format = "%H:%M:%S")
comb_time <- as.POSIXct(paste(date_conv, subsetdata[, 2]))

#Plot Global Active Power as function of time range in .png
png("plot2.png", width=480, height=480)
plot(comb_time, subsetdata[, 3], xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()
