# Debugging con R
# Autor: Sergio
# Fecha: 25- 11- 2021


#Este resumen explica como hacer DeBug de errores en el código en R de manera rápida
#browser(); para el código y permite ir línea por línea
#try(); tryCatch(); ambas te dejan probar el código aunque haya un error 
#testthat(); es una función para testear el código, localiza el Bug, imprescindible

#Haciendo Source para cargar la función prueba
source("C:/Users/Sergio/Desktop/R_en_Git/FuncionPrueba.R")
Funcionprueba("a")
# Error in log(x) : non-numeric argument to mathematical function porque no existe "a"


# Funcionprueba <- function(x) {
#   try(log(x))
#   print("Devolución función prueba")
# }
# 
# 
# 
# 
# 
# Funcionprueba <- function(x) {
#   browser() # con este codigo podemos ir paso por paso viendo donde está el error
#   tryCatch(log(x),
#            error= function(x) print ("error"),
#            warning= function (x) print ("warning"),  #si no hay un error pero hay un aviso
#            message= function (x) print ("message")
#   )
#   message ("Esto es un mensaje")
#   print("Devolución función prueba")
# }
# 
# install.packages("testthat")
# library(testthat)
# 
# test_that("Testeando que el tamaño es correcto",{
#   expect_equal(nchar("a"),1)
#   expect_equal(nchar("ab"),2)
#   expect_equal(nchar("abc"),3)
# })

