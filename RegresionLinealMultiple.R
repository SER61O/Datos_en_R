# Regresión lineal multiple 
#solo hay que cambiar lm.modelo
library (data.table)
library(ggplot2)

irisDT <- as.data.table(iris)

#set seed
set.seed(123)

#creando el model
lm.modelo <- lm(Petal.Width~. , data= irisDT) #predecir ancho por [largo]

summary(lm.modelo)

coef.cor <- cor(irisDT$Petal.Width,irisDT$Petal.Length)
coef.cor^2

#coeficientes
lm.modelo$coefficients

ggplot( data= irisDT,
        aes(x= Petal.Length,
            y= Petal.Width,
            colour= Species))+
  geom_point()+
  geom_abline(intercept=lm.modelo$coefficients[1],slope=lm.modelo$coefficients[2])

#predicciones
predicciones <- predict(lm.modelo)

#asignar prediccion a iris
irisDT[,pred := predicciones]

ggplot( data= irisDT,
        aes(x= Petal.Length,
            y= pred,                           #cambiamos aqui
            colour= Species))+
  geom_point()+
  geom_abline(intercept=lm.modelo$coefficients[1],slope=lm.modelo$coefficients[2])

#calculo RMSE
rmse <- sqrt(mean((irisDT$Petal.Width-irisDT$pred)^2))  #error 0.16 contando los valores mas grandes

mae <- mean((irisDT$Petal.Width-irisDT$pred)^2) #error 0.02
