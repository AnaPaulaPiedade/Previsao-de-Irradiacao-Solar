# Indica diretório que vai trabalhar
setwd("C:/Users/ana-p/Desktop/Previsao_Irradiacao_Solar/Previsao-de-Irradiacao-Solar/dados_Originais");

# lista todos os arquivos com extensão .csv
input <- dir(pattern='.csv')
L <- length(input)
print(L);


# Lendo arquivos e salvando em uma lista
dados <- NULL
for (i in 1:L){
  dados[[i]] <- read.csv(input[i],h=T, sep = ",")
  cat(input[i],'\n')
  #print(dados[i]);
}

# Juntando todos os CSV's em um só
var_Data <- list();
var_Hora <- list();
data_completa <- do.call("rbind",dados);

#Modificando data e hora para substituir
time <- as.character(data_completa$Date.time);
for(i in 1:length(time)){
  #print(strsplit(time[i]," ")[[1]][2]);
  var_Data[i] <- strsplit(time[i]," ")[[1]][1];
  var_Hora[i] <- strsplit(time[i]," ")[[1]][2];
}

#print(var_Data[274]);
#print(var_Hora[274]);


# Exclui Date/Time do dataframe
data_completa$Date.time <- NULL;

#Modificando o dataframe
data_completa$Data <- var_Data;
data_completa$Hora <- var_Hora;
print(data_completa);

data_completa$Data <- as.character(data_completa$Data);
data_completa$Hora <- as.character(data_completa$Hora);


#Filtro


comp <- data_completa[(data_completa$Hora >= "06:00:00" & data_completa$Hora <= "18:00:00" ), ]
print(comp);

comp <- as.matrix(comp);
write.csv(comp, "../dados_Preparados/joints/teste.csv", row.names = FALSE);
  

