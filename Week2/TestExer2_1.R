library(dplyr)
library(readxl)


data <- read_xls(paste0(getwd(), '/data/TrainExer21.xls'))

head(data)

model <- lm(data$LogWage~data$Female)

summary(model)

residuals(model)

e = data.frame(residuals(model))

colnames(e) <- 'Error'

dataError <- cbind.data.frame(data, e)

modelE <- lm(dataError$Error~dataError$Educ)

summary(modelE)
