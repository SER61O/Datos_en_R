# Analisis descriptivo
library (data.table)
irisDT <- as.data.table(iris)

#Summary y str
summary(irisDT)
str(irisDT)

# Fucion class
class(irisDT)

#Tabla de frecuencia
table(irisDT$Species)
prop.table(table(irisDT$Species))

# Tabla de frecuencia cruzada
table(irisDT$Species,irisDT$Petal.Width)

absolutas <- table(irisDT$Species,irisDT$Petal.Width)
relativas <- prop.table(table(irisDT$Species,irisDT$Petal.Width))

#Barplot
barplot(absolutas, main= "Ancho de petalo por especie", legend= rownames(absolutas))

#Tarta
etiquetas <- paste0(names(table(irisDT$Species)),"-",round(prop.table(table(irisDT$Species)),3)) # paste porque tiene que ser texto
pie(table(irisDT$Species), main= "Porcentaje de muestras por especie", labels= etiquetas)

# Histograma
hist(irisDT$Petal.Length, breaks =10)

# Boxplot
boxplot(irisDT$Petal.Length ~ irisDT$Species, main= "Largo de Petalo por especie")
boxplot(irisDT$Petal.Width ~ irisDT$Species, main= "Ancho de Petalo por especie")
boxplot(irisDT$Sepal.Length ~ irisDT$Species, main= "Largo de Sepalo por especie")
boxplot(irisDT$Sepal.Width ~ irisDT$Species, main= "Ancho de Sepalo por especie")

minimo <- min(irisDT$Petal.Width)
maximo <- max(irisDT$Petal.Width)
quantil <- quantile(irisDT$Petal.Width)
media <- mean(irisDT$Petal.Width)
mediana <- median(irisDT$Petal.Width)

varianza <- var(irisDT$Petal.Width)
IQR <- IQR(irisDT$Petal.Width) # Rango entre los cuartiles
desv <- sd(irisDT$Petal.Width, na.rm=T) #na.rm=T no cuenta los casos que fallan

plot(irisDT$Petal.Width, irisDT$Petal.Length)

