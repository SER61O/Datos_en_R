x <- 1+2+3
y <- 10/2

x+y
library()
install.packages("ggplot2")
library(ggplot2)
?qplot
qplot(Sepal.Length, Petal.Length, data = iris, color = Species)

instal.packages(xslx)
install.packages("xslx")
install.packages("rJava")
library(xslx)
library(rJava)
read.xlsx(file= "~/RStudio/datos.xlsx")
datos <- read_xlsx("~/RStudio/datos.xlsx")
datos
install.packages("XML")
library(XML)
datos.xml <- xmlTreeParse("C:/Users/Sergio/Documents/RStudio/datos.xml")
datos.xml
datos.xml <- xmlSApply(datos.xml,function(x)xmlSApply(x,xmlValue))
datos.xml
datos.xml <- data.frame(t(datos.xml),row.names = NULL)
datos.xml
install.packages("rjson")
library(rjson)
?fromJSON
datos.json <- fromJSON(file= "C:/Users/Sergio/Documents/RStudio/datos.json")
datos.json
datos.json <- data.frame(datos.json,row.names= NULL)
datos.json
mean(datos.json$Edad)
summary(iris)
str(iris)
datos.json$Mayor24 <- datos.json$Edad >24
datos.json
table(datos.json$Mayor24)
