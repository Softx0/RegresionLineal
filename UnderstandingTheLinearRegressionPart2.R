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

#Es primordial, ya que nos ofrece una pauta para continuar con nuestro analisis
#Tambien observamos el R-square que es de un 70%, tambien llamado el Coeficiente de determinacion
#Quiere decir que la variabilidad entre Y y X (Grasa y Edad), es menor, es bueno y nos damos cuenta
# con esto de que los puntos no distan mucho de la linea de regresion sin haberla creado ya.

#Tambien podemos realizar un analisis ANOVA, el Analysis of the Variance
#Esto nos da la BONDAD DE AJUSTE, si es significativa, se puede tener seguridad de que los datos son buenos usables
#Para la prediccion
anova(regresion)

#Si es significativa, la Hipotesis nula H0, se rechaza y la Alternativa se acoge H1 como cierta
#Que hay una correlacion diferente de cero


#Grafico de dispersion
plot(grasas$edad, grasas$grasas, xlab = "Edad", ylab = "Grasas")

#la recta correspondiente a la funcion de dicha grafico
abline(regresion)

#Se nota una correlacion positiva, pero hay un 30% que no esta siendo explicado por este modelo, por el 70% del R^2 













