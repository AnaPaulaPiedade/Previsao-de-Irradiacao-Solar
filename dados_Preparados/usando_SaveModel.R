bst2 <- xgb.load("xgboost.Abril2018model")

data2 <- read.csv(file.choose(), header = T) #selec arquivo
str(data2)
data2$Data <- as.factor(data2$Data)
data2$Hora <- as.factor(data2$Hora)

data3 <- sparse.model.matrix(PiranÃ.metro...1.solar_irradiance.Avg ~.-1, data = data2)
prev_Label <- data2[,"PiranÃ.metro...1.solar_irradiance.Avg"]

dados <- xgb.DMatrix(data = as.matrix(data3), label = prev_Label)

p2 <- predict(bst2, newdata = dados)
print(p2)

summary(p2)
