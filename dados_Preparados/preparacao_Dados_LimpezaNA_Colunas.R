# Indica diretório que vai trabalhar
setwd("C:/Users/ana-p/Desktop/Previsao_Irradiacao_Solar/Previsao-de-Irradiacao-Solar/dados_Preparados/joints");


# Lendo arquivo
#input <- dir(pattern='.csv')
#dados <- NULL
#dados <- read.csv(input,h = T, sep = ",")
#print(dados)
data <- read.csv(file.choose(), header = T) #selec arquivo
#Limpando as linhas com NA
data <- as.data.frame(data)
df1 <- na.omit(data)
#print(df1)

#Limpando colunas desnecessárias para treino
df1$addr<- NULL
df1$T.2 <- NULL
df1$T.1 <- NULL
df1$T <- NULL
df1$I.Min <- NULL
df1$I.Max <- NULL
df1$I.Avg <- NULL
df1$V.Min <- NULL
df1$V.Max <- NULL
df1$V.Avg <- NULL
df1$D1.Median <- NULL
df1$D1.Sum <- NULL
df1$D1.Count <- NULL
df1$D1.StdDev <- NULL
df1$D1.Min <- NULL
df1$D1.Max <- NULL
df1$D1.Avg <- NULL
df1$C1.Median <- NULL
df1$C1.Sum <- NULL
df1$C1.Count <- NULL
df1$C1.StdDev <- NULL
df1$C1.Min <- NULL
df1$C1.Max <- NULL
df1$C1.Avg <- NULL
df1$A4.Median <- NULL
df1$A4.Count <- NULL
df1$A4.StdDev <- NULL
df1$A4.Min <- NULL
df1$A4.Max <- NULL
df1$A4.Avg <- NULL
df1$A3.Median <- NULL
df1$A3.Count <- NULL
df1$A3.StdDev <- NULL
df1$A3.Min <- NULL
df1$A3.Max <- NULL
df1$A3.Avg <- NULL
df1$A2.Median <- NULL
df1$A2.Count <- NULL
df1$A2.StdDev <- NULL
df1$A2.Min <- NULL
df1$A2.Max <- NULL
df1$A2.Avg <- NULL
df1$A1.Median <- NULL
df1$A1.Count <- NULL
df1$A1.StdDev <- NULL
df1$A1.Min <- NULL
df1$A1.Max <- NULL
df1$A1.Avg <- NULL
df1$Abertura.QD.status.Sum <- NULL
df1$Abertura.QD.status.Count <- NULL
#..............modificação retirando dados do piranômetro 2
df1$PiranÃ.metro...2.solar_irradiance.Median <-NULL
df1$PiranÃ.metro...2.solar_irradiance.Sum <- NULL
df1$PiranÃ.metro...2.solar_irradiance.Count<- NULL
df1$PiranÃ.metro...2.solar_irradiance.StdDev<-NULL
df1$PiranÃ.metro...2.solar_irradiance.Min<-NULL
df1$PiranÃ.metro...2.solar_irradiance.Max<-NULL
df1$PiranÃ.metro...2.solar_irradiance.Avg <-NULL

#..............Retirando parametros do piranômentro 1
df1$PiranÃ.metro...1.solar_irradiance.Median <- NULL
df1$PiranÃ.metro...1.solar_irradiance.Sum <- NULL
df1$PiranÃ.metro...1.solar_irradiance.Count <- NULL
df1$PiranÃ.metro...1.solar_irradiance.StdDev <-NULL
df1$PiranÃ.metro...1.solar_irradiance.Min <- NULL
df1$PiranÃ.metro...1.solar_irradiance.Max <- NULL
df1$Temperatura...Umidade.humidity.Min <- NULL





#Criando novo csv
comp <- as.matrix(df1);
write.csv(comp, "prep2Media_Marco2019.csv", row.names = FALSE)