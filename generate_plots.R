generate_plots <- function() {
        
        library(dplyr)
        
        setwd("C:\\coursera\\exploratory-analysis-course\\week-1")
        
        ##library(datasets)
        
        ## Base plotting
        
        ## plot - scatterplot
        ## lines - adds lines to scatter plot
        ## points - adds points to scatter plot
        ## text - adds text labels to a plots using x,y co-ords
        ## title - add annotations
        ## mtext - add arbitrary text to margins
        ## axis - adding axis ticks/labels
        
        ## histogram:
        ## hist(airquality$Ozone)
        
        ## scatter plot:
        
        ## with(airquality, plot(Wind, Ozone))
        ## title(main = "Ozone and Wind in New York City")
        ## with(subset(airquality, Month == 5), points(Wind, Ozone, col="blue"))
        ## with(subset(airquality, Month != 5), points(Wind, Ozone, col="red"))
        ## legend("topright", pch = 1, col = c("blue", "red"), legend = c("May", "Other Months"))
        
        ## OR scatter plot with regression line
        
        ## with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City", pch = 20))
        ## model <- lm(Ozone ~ Wind, airquality)
        ## abline(model, lwd = 2)
        
        ## OR with multiple plots
        
        ## par(mfrow = c(1,2))
        ## with(airquality, {
        ##        plot(Wind, Ozone, main = "Ozone and Wind")
        ##        plot(Solar.R, Ozone, main = "Ozone and Solar Radiation")
        ## })
        
        ## box plot
        ## airquality <- transform(airquality, Month = factor(Month))
        ## boxplot(Ozone ~ Month, airquality, xlab = "Month", ylab = "Ozone (ppb)")
        
        
        
        ## Look at ?par for help on base plotting
        ## Parameters that can be supplied to a particular plot are:
        
        ## pch - the plotting symbol
        ## lty - the line type
        ## lwd - the line width
        ## col - the plot colour
        ## xlab - x-axis label
        ## ylab - y-axis label
        
        ## Set the global parameter with the par function
        ## try running par("lty")

        ## las - orientation of the axis labels
        ## bg - the background colour
        ## mar - the margin size
        ## oma - the outer margin size
        ## mfrow - number of pots per row, column (plots are filled row-wise)
        ## mfcol - number of pots per row, column (plots are filled column-wise)

}