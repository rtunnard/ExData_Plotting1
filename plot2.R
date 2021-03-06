library(dplyr)

household_power_consumption <- read.csv("./household_power_consumption.txt", sep=";", na.strings="?",header=TRUE)

household_power_consumption <- transform(household_power_consumption, Date = as.Date(Date,"%d/%m/%Y"))
household_power_consumption <-(filter(household_power_consumption, Date=="2007-02-01"|Date=="2007-02-02"))
household_power_consumption$DateTime <- with(household_power_consumption, strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"))

png(filename = "plot2.png")
with(household_power_consumption,plot(DateTime,Global_active_power,type="l",col="black",xlab="",main="",ylab="Global Active Power (kilowatts)"))
dev.off()
