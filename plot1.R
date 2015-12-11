draw_plot1 <- function() {
        
        library(dplyr)
        
        setwd("C:\\coursera\\exploratory-analysis-course\\week-1-project")
  
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
        
        readData <- read.table("./data/zipcontents/household_power_consumption.txt", sep=";", header=T, quote= "", strip.white=TRUE, stringsAsFactors = F, na.strings= "?")
        plotData <- mutate(readData, DateAndTime = paste(Date, Time, sep = ' '))
        plotData$DateAndTime <- as.POSIXct(strptime(plotData$DateAndTime, format="%e/%m/%Y %H:%M:%S"))
        plotData$Date <- as.Date(strptime(plotData$Date, format="%e/%m/%Y"))
        plotData <- filter(plotData, between(Date, as.Date("2007-02-01"), as.Date("2007-02-02")))

        ## Figure 1
        
        png(filename = "plot1.png", width = 480, height = 480,
            units = "px", pointsize = 12, bg = "white", res = NA,
            restoreConsole = TRUE)
        hist(plotData$Global_active_power, breaks=c(0,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,7.5,8), main = "Global Active Power",xlab="Global Active Power (kilowatts)", col = "RED",ylim=c(0, 1200),xaxt='n')
        axis(side=1, at=c(0,2,4,6), labels = c(0,2,4,6))
        dev.off()

}