## Loadinglarge dataset.
setwd("D:/privat/Coursera/DataSpecialization/Exploratory-Data-Analysis/Assignment-1")
filename <- "./household_power_consumption.txt"
power_data <- read.table(filename,
                   header = TRUE,
                   sep = ";",
                   colClasses = c("character", "character", rep("numeric",7)),
                   na = "?")

attach(power_data)

subset_2007 <- Date == "1/2/2007" | Date == "2/2/2007"
sample <- subset(power_data, subset_2007)
attach(sample)
time_str <- paste(Date, Time)
sample$DateTime <- strptime(time_str, "%d/%m/%Y %H:%M:%S")
rownames(sample) <- 1:nrow(sample)
dim(sample) # 2880   10
attach(sample)