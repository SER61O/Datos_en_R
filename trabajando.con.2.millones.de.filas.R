# Este script es para importar y separ los archivos Csv por pais en 1 csv para cada país


#archivo con más de 2 millones de filas ( no posible en Excel)

library(data.table)
setwd("C:/Users/Sergio/Desktop/R_en_Git")
archivo.importado <- fread ("usuarios-pais.csv")

dir.create(file.path("C:/Users/Sergio/Desktop/R_en_Git/paises"), showWarnings = FALSE)

setwd("C:/Users/Sergio/Desktop/R_en_Git/paises")

for(i in unique(archivo.importado$Country)) {
  
  pais.seleccionado <- archivo.importado[Country == i]
  fwrite(pais.seleccionado, paste0(i,".csv"))
}
