data <- read.csv(file.choose(), header = T) #selec arquivo
str(data) #ve os tipos das vari�veis, a estrutura do objeto
data$Data <- as.factor(data$Data)
data$Hora <- as.factor(data$Hora)

summary(data$Piran�.metro...1.solar_irradiance.Avg)
