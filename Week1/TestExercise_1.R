library(plyr)
library(readxl)


data <- read_xls(paste0(getwd(),"/data/TestExer1-holiday expenditures-round2.xls"))

model <- lm(Expenditures~Age, data)

summary(model)

plot(data$Age,data$Expenditures)
abline(model, col = 'darkblue')


hist(data$Age)
hist(data$Expenditures)


dataA40 <- data[data$Age >= 40,]

dataB40 <- data[data$Age < 40,]


modelA40 <- lm(Expenditures~Age, dataA40)

summary(modelA40)

plot(dataA40$Age, dataA40$Expenditures)
abline(modelA40, col = 'red')

modelB40 <- lm(Expenditures~Age, dataB40)

summary(modelB40)

plot(dataB40$Age, dataB40$Expenditures)
abline(modelB40, col = 'orange')


