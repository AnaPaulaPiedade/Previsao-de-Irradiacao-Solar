data <- read.csv(file.choose(), header = T) #selec arquivo
str(data) #ve os tipos das variáveis, a estrutura do objeto
data$Data <- as.factor(data$Data)
data$Hora <- as.factor(data$Hora)

summary(data$PiranÃ.metro...1.solar_irradiance.Avg)
