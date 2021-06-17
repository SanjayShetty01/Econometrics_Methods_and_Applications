library(plyr)
library(readxl)


data <- read_xls(paste0(getwd(),'/data/TrainExer11.xls'))


hist(data$Age)
hist(data$Expenditures)


plot(data$Age, data$Expenditures)


summary(data)


dataB40 <- subset(data, Age <40)

dataB40
  
mean(dataB40$Expenditures)

dataA40 <- data[data$Age >=40,]

mean(dataA40$Expenditures)






