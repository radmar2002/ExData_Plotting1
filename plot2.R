rm(list=ls())  ## clear memeory
setwd("D:/COURSERA_DATA_SCIENCE/Exploratory_Data_Analysis/Peer_Assesment")  ## set the working directory
list.files()   ## inspect the files in current directory

## load the data
## specify the classes for the columns
data1 <- read.table("household_power_consumption.txt", head=TRUE, sep=";", na.strings = "?", skip = 66636, nrow = 2880,
                    colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
                    col.names = colnames(read.table("household_power_consumption.txt", nrow = 1, header = TRUE, sep=";")))

## create instrumental Date_Time variable
## this is POSIXlt type 
data1$Date_Time <- strptime(paste(data1$Date, data1$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

## check the data
#head(data1)
#str(data1)
#dim(data1)
#tail(data1)


png(filename="plot2.png", ## initialize the plot that will be written directly to a png file
    width = 480, height = 480, units = "px",
    bg = "transparent")

plot(data1$Date_Time,data1$Global_active_power, type = "l",cex.axis = 0.9,
     ylab="Global Active Power (kilowatts)",xlab="")

dev.off()               ## return output to the terminal