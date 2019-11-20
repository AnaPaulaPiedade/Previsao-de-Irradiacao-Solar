# Packages
library(xgboost)
library(magrittr)
library(dplyr)
library(Matrix)


# Data
data <- read.csv(file.choose(), header = T) #selec arquivo
str(data) #ve os tipos das variáveis, a estrutura do objeto
data$Data <- as.factor(data$Data)
data$Hora <- as.factor(data$Hora)#selec a coluna rank e transforma em factor (conta os tipos de variaveis)
#print(data$rank)

# Partition data
set.seed(1234) #Pega sempre as mesmas linhas
ind <- sample(2, nrow(data), replace = T, prob = c(0.8, 0.2)) #80% dos dados vão p/ treino e 20% pra teste.
train <- data[ind==1,]
test <- data[ind==2,]

str(train)
str(test)

# Create matrix - One-Hot Encoding for Factor variables
#data$PiranÃ.metro...2.solar_irradiance.Avg <- as.factor(data$PiranÃ.metro...2.solar_irradiance.Avg)

trainm <- sparse.model.matrix(PiranÃ.metro...1.solar_irradiance.Avg ~ .-1, data = train) 
head(trainm)
train_label <- train[,"PiranÃ.metro...1.solar_irradiance.Avg"]
str(train_label)
train_matrix <- xgb.DMatrix(data = as.matrix(trainm), label = train_label)

testm <- sparse.model.matrix(PiranÃ.metro...1.solar_irradiance.Avg ~.-1, data = test)
head(testm)
test_label <- test[,"PiranÃ.metro...1.solar_irradiance.Avg"]
test_matrix <- xgb.DMatrix(data = as.matrix(testm), label = test_label)

# Parameters

head(train_label)
#nc <- length(unique(train_label))
xgb_params <- list("objective" = "reg:squarederror",
                   "eval_metric" = "rmse")
watchlist <- list(train = train_matrix, test = test_matrix)

# eXtreme Gradient Boosting Model
bst_model <- xgb.train(params = xgb_params,
                       data = train_matrix,
                       nrounds = 1000,
                       watchlist = watchlist,
                       eta = 0.001,   #velocidade de aprendizagem
                       max.depth = 3, #profundidade da árvore
                       gamma = 0,     
                       subsample = 1, #
                       colsample_bytree = 1,
                       missing = NA,
                       seed = 333)

# Training & test error plot
#e <- data.frame(bst_model$evaluation_log)
#plot(e$iter, e$train_mlogloss, col = 'blue')
#lines(e$iter, e$test_mlogloss, col = 'red')

#min(e$test_mlogloss)
#e[e$test_mlogloss == 0.625217,]

# Feature importance
imp <- xgb.importance(colnames(train_matrix), model = bst_model)
print(imp)
xgb.plot.importance(imp)

# Prediction & confusion matrix - test data

p <- predict(bst_model, newdata = test_matrix)
print(p)
#xgb.save(bst_model, "xgboost.1Marco2018model")


#.................................................
data2 <- read.csv(file.choose(), header = T) #selec arquivo
str(data2)
data2$Data <- as.factor(data2$Data)
data2$Hora <- as.factor(data2$Hora)

data3 <- sparse.model.matrix(PiranÃ.metro...1.solar_irradiance.Avg ~.-1, data = data2)
prev_Label <- data2[,"PiranÃ.metro...1.solar_irradiance.Avg"]

dados <- xgb.DMatrix(data = as.matrix(data3), label = prev_Label)

p2 <- predict(bst_model, newdata = dados)
print(p2)

summary(p2)
