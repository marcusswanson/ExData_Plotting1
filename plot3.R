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
        
        ## Figure 2
        
        png(filename = "plot3.png", width = 480, height = 480,
            units = "px", pointsize = 12, bg = "white", res = NA,
            restoreConsole = TRUE)
        
        with(plotData, plot(DateAndTime, Sub_metering_1, type = "n", xlab="", ylab="Energy sub metering",ylim=c(0, 37)))
        with(plotData, lines(DateAndTime, Sub_metering_1, col="black"))
        with(plotData, lines(DateAndTime, Sub_metering_2, col="red"))
        with(plotData, lines(DateAndTime, Sub_metering_3, col="blue"))
        legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
        dev.off()

}