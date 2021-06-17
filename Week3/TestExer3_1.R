library(plyr)
library(readxl)
library(ggplot2)

setwd("~/Personal not your shit/H./Online Classes/R programming/Econometrics/Week3")

data <- read_xlsx(paste0(getwd(), '/data/TrainExer 3-1.xlsx'))


data$LogSP500 <- log(data$Index)

for (i in 2:nrow(data)){
  data$LogChangeSP500[1] <- 0
  data$LogChangeSP500[i] <- data$LogSP500[i] - data$LogSP500[i-1]
}

model1 <- lm(LogChangeSP500~BookMarket, data)

summary(model1)

Error <- data.frame(residuals(model1))

colnames(Error) <- 'ErrorChangeSP500'

data <- cbind(data, Error)



model2 <- (lm(data$Index~data$BookMarket))

summary(model2)

Error <- data.frame(residuals(model2))

colnames(Error) <- 'ErrorIndex'

data <- cbind(data, Error)

fittedLine <- data.frame(fittedValues = predict(model2, data.frame(BookMarket=data$BookMarket)))

data <- cbind(data, fittedLine)


plot(data$Year,data$ErrorIndex, type = 'o', ylim = range(c(data$ErrorIndex,data$fittedValues)))
lines(x =  data$fittedValues, type = 'o', col = 'red')


plot(data$Year, data$Index, type = 'line')

plot(data$Year, data$fittedValues, type = 'o', col=  'red')


ggplot2::ggplot(data, aes(x = Year))+
  geom_line(aes(y = Index, col = 'blue'))+
  geom_line(aes(y = fittedValues, col = 'red'))+
  scale_color_discrete(name = '', labels = c('Index', 'Fitted Values'))
