draw_plot2 <- function() {
        
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
        
        ## Figure 2
        
        png(filename = "plot2.png", width = 480, height = 480,
            units = "px", pointsize = 12, bg = "white", res = NA,
            restoreConsole = TRUE)
        
        with(plotData, plot(DateAndTime, Global_active_power, type = "n", xlab="", ylab="Global Active Power (kilowatts)",ylim=c(0, 7.6), axes=FALSE))
        with(plotData, lines(DateAndTime, Global_active_power))
        axis.POSIXct(side = 1, plotData$DateAndTime, format = "%a")
        axis(side=2, at=c(0,2,4,6))
        box(which = "plot", lty = "solid")
        dev.off()

}