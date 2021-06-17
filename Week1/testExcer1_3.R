library(plyr)
library(readxl)



data <- read_xls(paste0(getwd(),'/data/TrainExer13.xls'))

colnames(data) <- c('Game','Year',"Winning_Time")

model <- (lm(Winning_Time~Year, data = data))


new_data <- as.data.frame(c(2008,2012,2016))
colnames(new_data) <- 'Year'


predict(model, data.frame(Year = c(2008, 2012, 2016)))

