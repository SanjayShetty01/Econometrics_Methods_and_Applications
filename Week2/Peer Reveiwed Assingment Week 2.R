library(readxl)

setwd("~/Personal not your shit/H./Online Classes/R programming/Econometrics/Week2")

data <- read_xls(paste0(getwd(), '/data/TestExer2-GPA-round2.xls'))


model <-lm(FGPA~SATV, data)

summary(model)

new_SATV <- data$SATV+1

new_SATV <- data.frame(new_SATV)
colnames(new_SATV) <- 'SATV'


predict_1_up <- predict(model, new_SATV, interval = 'confidence')
predict_1_up
