project_dir <- getwd()

setwd("../exdata_data_household_power_consumption")

power_cons  <- read.delim("household_power_consumption.txt",
                          header=T, 
                          sep=";",
                          colClasses = c(rep("character",2), 
                                         rep("numeric",5)),
                          na.strings = "?",
                          skipNul=T)


power_cons$Date <- as.Date(power_cons$Date[], format = "%d/%m/%Y")

power_cons_sel <- power_cons [(power_cons$Date >= "2007-02-01") &
                          (power_cons$Date <= "2007-02-02"),3]

setwd(project_dir)

png("plot1.png", width=480, height=480)

hist(power_cons_sel, 
     col = "red", 
     xlab = "Global Active Power (killowatts)",
     #ylab = "Frequency",
     main = "Global Active Power")

dev.off()

remove(project_dir)
remove(power_cons)
remove(power_cons_sel)
    