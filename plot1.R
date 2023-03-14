library(plyr)

# Check for existing file, then download the data
setwd("C:/Users/tobin/Documents/GitHub")
if(!file.exists("./ExData_Plotting1")){dir.create("./ExData_Plotting1")}
file_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(file_url, destfile = "./ExData_Plotting1/projectdataset.zip")

# Unzip file
unzip(zipfile = "./ExData_Plotting1/projectdataset.zip", exdir = "./ExData_Plotting1")

#Read household power data
hpower <- read.table("./ExData_Plotting1/household_power_consumption.txt")
