library(dplyr)
library(lubridate)

temp <- tempfile()
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,temp)
unzip(zipfile=temp,exdir="./")

data <- read.table("./household_power_consumption.txt")

unlink(temp)

# reading relevant data
data <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880)

# clearing name row and unrelevant variables, creating numerics
data <- data %>% select(V3) %>% mutate(V3 = as.numeric(as.character(V3)))

# create histogram
png("plot1.png", width=480, height=480)
hist(data$V3, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (killowatts)", ylab = "Frequency")
dev.off()
