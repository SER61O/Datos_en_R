install.packages("data.table")
library(data.table)
iris
DTiris <- as.data.table(iris)
#buscar media de cada caracteristica por especies

DTiris [ , .(
  sepalo=sepalo <- mean(Sepal.Length),
  sepalo_ancho=sepalo <- mean(Sepal.Width),
  petalo_largo=mediar <- mean(Petal.Length),
  petalo_ancho=medir <- mean(Petal.Width)
  ), by= Species]

DTiris[, lapply(.SD, mean), by= Species]

#Crear columna nueva por referencia
DTiris[Sepal.Length>5, Sepal.Length.Tam:="Grande"]
DTiris[Sepal.Length<=5, Sepal.Length.Tam:="Pequeño"]
DTiris

#Borrar por referencia
DTiris[, Sepal.Length.Tam :=NULL]
DTiris
