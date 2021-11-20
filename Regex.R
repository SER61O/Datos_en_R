dias <- c("Lunes.","Martes.","Miércoles","Jueves","Viernes","Sabado","Domingo")

# Indica si el patrón existe
grepl("a",dias)
# Expone quien tiene el patrón
dias[grepl("a",dias)]
grepl("^M", dias)
dias[grepl("^M", dias)]
grepl("s$", dias)
dias[grepl("s$", dias)]

# reemplazar una vez
sub("a","aaaaa",dias)
# reemplazar todos (saaaabaaaado)
gsub ("a","aaaaaa",dias)
# METACARACTERES
gsub ("\\.","",dias)

# .* cualquier caracter que coincida una o mas veces
# \\s un espacio
# [0-9]+ cualquier caracter del 0 al 9 almenos una vez
# [A-Z]+ mayúsculas almenos una vez
