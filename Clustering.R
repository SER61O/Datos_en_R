# Hierarchical Clustering
library(ggplot2)
library(data.table)
irisDT <- as.data.table(iris)


ggplot(data=irisDT,
       aes(x= Sepal.Width,
           y= Sepal.Length,
           colour= Species)) +
  geom_point()

ggplot(data=irisDT,
       aes(x= Petal.Width,
           y= Petal.Length,
           colour= Species)) +
  geom_point()


iris.all <- irisDT[, c("Petal.Length","Petal.Width")] #solo la columna Petal.Width","Petal.Length

#set.seed para poder predecir los resultados
set.seed(123) 

#calculando las distancias
iris.dist <- dist(iris.all,method= "euclidean")
hc.iris <- hclust(iris.dist, method= "complete")

#plot dendograma
plot(hc.iris)

#sabemos que son 3 clusters (grupos)
cluster <- cutree(hc.iris,k= 3)

#Asignar el cluster
iris.all[,cluster:= cluster]  #crea la columna nueva de clustering
iris.all[,Species := irisDT$Species] # metemos de nuevo Species para comprobar que coinciden

#plot con predicciones de cluster
ggplot(data=irisDT,
       aes(x= Sepal.Width,
           y= Sepal.Length,
           colour= factor(cluster))) +   
  #con formato numerico ponemos factor para que no interprete como un numero continuo
  geom_point()
ggplot(data=irisDT,
       aes(x= Petal.Width,
           y= Petal.Length,
           colour= factor(cluster))) +
  geom_point()


tab <- table(iris.all$cluster,iris.all$Species) # falla solo en versicolor

accuracy <- (tab[1,1]+tab[3,2]+tab[2,3]/ sum(tab)) #precision del 79,3%

#si cambiamos los datos mejora la precisión 
# iris.all <- irisDT[, !c("Species")] <- iris.all <- irisDT[, c("Petal.Length","Petal.Width)]



#K Mean clustering
kmean <- kmeans(iris.all[,1:2],centers= 3)

kmean$cluster

#Asignar cluster
iris.all [, cluster := kmean$cluster]

ggplot(data=iris.all,
       aes(x= Petal.Length,
           y= Petal.Width,
           colour= factor(cluster))) +
  geom_point()

tab <- table(iris.all$cluster,iris.all$Species) 

accuracy <- (tab[2,1]+tab[1,2]+tab[3,3]/ sum(tab)) #precision del 98,3%



# si no sabemos cuantos clusters queremos hacer se hace un plot de codo
install.packages("tidyverse")
library(purrr)

kmean$tot.withinss

# en un nuevo objeto calculamos
tot.withinss <- map_dbl(1:10,function(k){
  model <- kmeans(iris.all[,1:2],centers=k) #buscamos el mejor cluster 1:10
  model$tot.withinss
})

codo <- data.table(k=1:10,
                   tot_withinss= tot.withinss)

ggplot(codo, aes(x=k, y= tot_withinss))+
  geom_line()+
  scale_x_continuous(breaks=1:10)  #en el grafico el codo se ve 2 y 3 posibles clusters
