#La regresion lineal simple en R

#Datasource
grasas <- read.table("/Users/Mac/Desktop/UNIVERSIDAD/Autodidacta/AlgoritmosAvanzados/RegresionLineal/Resources/EdadPesoGrasas.txt", header = T)

#columnas que contiene
names(grasas)

#Que datos contienen
grasas

#Analisis exploratorio mediante la correlacion de las variables, en este caso son 3
cor(grasas)

# Podemos observar que:
#   1. La edad con el peso tienen una relacion pobre de 24%
#   2. La grasa corporal con el peso por igual un 26%
#   3. Pero La Grasa con la edad tienen un 83% de correlacion

#Graficamente
pairs(grasas)

#lineal model, vamos a crear el modelo de regresion lineal
#Regresion lineal simple = una ecuacion de prediccion
regresion <- lm(grasas ~ edad, data = grasas)

#Observamos el modelo
summary(regresion)

# El intercepto(intercept) y la pendiente
# El intercepto tiene una significancia del 99%
# La pendiente (edad) aun mas significativo el 99.9%

#Es primordial, ya que observamos 












