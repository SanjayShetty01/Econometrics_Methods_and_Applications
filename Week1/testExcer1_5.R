library(plyr)
library(readxl)



data <- read_xls(paste0(getwd(), '/data/TrainExer15.xls'))

data

colnames(data) <- c('Game', 'Year', 'WinningTimeMen', 'WinningTimeWomen')

model1 <- lm(WinningTimeWomen~Year, data)
model2 <- lm(WinningTimeMen ~ Year , data)

summary(model1)

summary(model2)


predict(model2, data.frame(Year = c(2140, 2192)))

model3 <- lm(, data)

summary(model3)
