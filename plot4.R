draw_plot <- function() {
        
        library(dplyr)
        
        setwd("C:\\coursera\\exploratory-data-analysis\\week-1\\project")
  
        ## Create the data folder
        if(!file.exists("data")) {
                dir.create("data")
        }
        
        ## Download the zip file for the course
        if(!file.exists("./data/project.zip")) {
                print("downloading project.zip...")
                fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
                download.file(fileUrl, destfile = "./data/project.zip", mode = "wb")
                list.files("./data")
                print("downloaded project.zip.")
        }
        
        if(!file.exists("./data/zipcontents")) {
                unzip("./data/project.zip", exdir="./data/zipcontents")
        }
        
        readData <- read.table("./data/zipcontents/household_power_consumption.txt", sep = ";", header=TRUE)
        
        plotData <- mutate(readData, DateAndTime = paste(Date, Time, sep = ' '))
        plotData$DateAndTime <- as.POSIXct(strptime(plotData$DateAndTime, format="%e/%m/%Y %H:%M:%S"))
        plotData$Date <- as.Date(strptime(plotData$Date, format="%e/%m/%Y"))
        plotData <- filter(plotData, between(Date, as.Date("2007-02-01"), as.Date("2007-02-02")))
        plotData$Global_active_power_in_kw <- as.double(plotData$Global_active_power)/1000
        
        ## Figure 4
        
        png(filename = "plot4.png", width = 480, height = 480,
            units = "px", pointsize = 12, bg = "white", res = NA,
            restoreConsole = TRUE)
        
        par(mfrow = c(2,2))
        with(plotData, {
          
              plot(DateAndTime, Global_active_power_in_kw, type = "n", xlab="", ylab="Global Active Power (kilowatts)",ylim=c(0, 6))
              lines(DateAndTime, Global_active_power_in_kw)
              
              plot(DateAndTime, as.double(Voltage)/8.1, type = "n", xlab="datetime", ylab="Voltage")
              lines(DateAndTime, as.double(Voltage)/8.1)

              plot(DateAndTime, Sub_metering_1, type = "n", xlab="", ylab="Energy sub metering",ylim=c(0, 37))
              lines(DateAndTime, Sub_metering_1, col="black")
              lines(DateAndTime, Sub_metering_2, col="red")
              lines(DateAndTime, Sub_metering_3, col="blue")
              
              plot(DateAndTime, as.double(Global_reactive_power)/500, type = "n", xlab="datetime", ylab="Global_reactive_power", ylim=c(0,0.5))
              lines(DateAndTime, as.double(Global_reactive_power)/500)
        })

        dev.off()

}