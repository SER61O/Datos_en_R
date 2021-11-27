# Regresión lineal logistica 

library (data.table)
library(ggplot2)
install.packages("pROC")
library(pROC)

irisDT <- as.data.table(iris)

iris.v <- irisDT[Species!= "setosa"]

#set seed
set.seed(123)

#creando el model
glm.modelo <- glm(Species ~. , data= iris.v, family= binomial) #SI/NO

summary(lm.modelo)

#predicciones
predicciones <- predict(glm.modelo, type= "response") # 1 o 0


#asignar predicciones
iris.v[,pred:= predicciones]

# hay que crear un corte ROC
iris.v[pred>=0.5, pred_final:= 1]
iris.v[pred<0.5, pred_final:= 0]

iris.v$Species <- factor(iris.v$Species, levels= c("versicolor","virginica")) #setosa out

tbl <- table(iris.v$Species, iris.v$pred_final)

precision <- (tbl[1,1]+tbl[2,2])/sum(tbl)#0.98

#curva Roc
roc <- roc(iris.v$Species,iris.v$pred)
plot(roc)

# tabla de cortes
cortes <- data.table(corte=round(roc$thresholds,2),
                     sensitivities= roc$sensitivities,
                     specifities= roc$specificities)

#cambiamos corte si queremos cambiar FP o FN en linea 28,29
